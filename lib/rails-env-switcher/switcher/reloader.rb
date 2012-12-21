module RailsEnvSwitcher::Switcher::Reloader
  def self.switch_env(old_env, env, options={})
    # delete because we don't necessarily want to reload when we go back to
    # the original environment
    if options.delete(:reload)
      reload!(false) if respond_to?(:reload!)
      FactoryGirl.reload if defined?(FactoryGirl)
    end
  end
end
