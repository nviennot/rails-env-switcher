module RailsEnvSwitcher::Switcher::Mongoid
  def self.switch_env(old_env, env, options={})
    old_level = Mongoid.logger.level
    Mongoid.logger.level = Logger::WARN
    Mongoid.load!("./config/mongoid.yml")
    Mongoid.logger.level = old_level

    options[:reload] = true # finalizes the mongodb database switch
  end
end
