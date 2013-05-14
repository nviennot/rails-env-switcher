module RailsEnvSwitcher::Switcher::Reloader
  def self.switch_env(old_env, env, options={})
    if options[:reload]
      ActionDispatch::Reloader.cleanup!
      ActionDispatch::Reloader.prepare!
      FactoryGirl.reload if defined?(FactoryGirl)
    end
  end
end
