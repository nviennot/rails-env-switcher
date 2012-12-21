module RailsEnvSwitcher
  autoload :Pry,            'rails-env-switcher/pry'
  autoload :Switcher,       'rails-env-switcher/switcher'
  autoload :ConsoleMethods, 'rails-env-switcher/console_methods'

  mattr_accessor :env, :handlers
  self.env = Rails.env
  self.handlers = []

  def self.with_env(env)
    return yield if self.env == env
    old_env = self.env

    # Not using ActiveSupport callbacks because the order matters.
    self.handlers.reverse.reduce(proc { yield }) do |chain, handler|
      proc do
        handler.switch_env(old_env, env)
        begin
          chain.call
        ensure
          handler.switch_env(env, old_env)
        end
      end
    end.call
  end

  def self.switch_env(old_env, env)
    self.env = env
  end

  def self.add_handler(handler)
    self.handlers << handler
  end

  def self.setup
    # The order matters: handlers are executed top to bottom when switching env
    add_handler Switcher::Bundler
    add_handler Switcher::Reloader
    add_handler Switcher::Rails
    add_handler Switcher::ActiveRecord     if defined?(::ActiveRecord::Base)
    add_handler Switcher::Mongoid          if defined?(::Mongoid)
    add_handler Switcher::CopycopterClient if defined?(::CopycopterClient::Rails)
    add_handler Switcher::Rails
    add_handler Switcher::Reloader
    add_handler self

    RailsEnvSwitcher::Pry.setup if defined?(::Pry)
  end

  setup
end
