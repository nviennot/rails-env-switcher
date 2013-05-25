module RailsEnvSwitcher::Switcher::Reloader
  def self.switch_env(old_env, env, options={})
    if options[:reload]
      unless Rails.application.config.cache_classes
        ActionDispatch::Reloader.cleanup!
        ActionDispatch::Reloader.prepare!
      end
      FactoryGirl.reload if defined?(FactoryGirl)
    end
  end
end
