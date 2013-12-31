module RailsEnvSwitcher
  autoload :Pry,            'rails-env-switcher/pry'
  autoload :Switcher,       'rails-env-switcher/switcher'
  autoload :ConsoleMethods, 'rails-env-switcher/console_methods'

  def self.with_env(env, options={})
    options = options.dup
    old_env = Rails.env

    begin
      switch_env(env, options)
      yield
    ensure
      options.delete(:reload) # not reloading again once we switch back
      switch_env(old_env, options)
    end
  end

  def self.switch_env(env, options={})
    old_env = Rails.env

    if old_env != env
      self.handlers.each do |handler|
        handler.switch_env(old_env, env, options)
      end
    else
      # Always reload if needed
      Switcher::Reloader.switch_env(env, env, options)
    end
  end

  class << self; attr_accessor :handlers; end
  self.handlers = []
  def self.add_handler(handler)
    self.handlers << handler
  end

  def self.setup
    # The order matters: handlers are executed top to bottom when switching env
    add_handler Switcher::Bundler
    add_handler Switcher::Rails
    add_handler Switcher::ActiveRecord     if defined?(::ActiveRecord::Base)
    add_handler Switcher::Mongoid          if defined?(::Mongoid)
    add_handler Switcher::CopycopterClient if defined?(::CopycopterClient::Rails)
    add_handler Switcher::Reloader

    RailsEnvSwitcher::Pry.setup if defined?(::Pry)
  end

  setup
end
