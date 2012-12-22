module RailsEnvSwitcher::Switcher::Rails
  def self.switch_env(old_env, env, options={})
    return if ::Rails.env == env

    ENV['RAILS_ENV'] = ::Rails.env = env
    Kernel.silence_warnings do
      Dir[Rails.root.join('config', 'initializers', '*.rb')].each { |file| load file }
      load Rails.root.join('config', 'environments', "#{env}.rb")
    end
  end
end
