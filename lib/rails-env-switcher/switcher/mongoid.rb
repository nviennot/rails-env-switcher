module RailsEnvSwitcher::Switcher::Mongoid
  def self.switch_env(old_env, env)
    reconnect
  end

  def self.reconnect
    old_level = Mongoid.logger.level
    Mongoid.logger.level = Logger::WARN
    Mongoid.load!("./config/mongoid.yml")
    Mongoid.logger.level = old_level

    RailsEnvSwitcher::Switcher::Reloader.need_reload # finalizes the mongodb database switch
  end
end
