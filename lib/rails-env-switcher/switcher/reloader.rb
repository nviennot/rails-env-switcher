module RailsEnvSwitcher::Switcher::Reloader
  mattr_accessor :should_reload

  def self.switch_env(old_env, env)
    if self.should_reload
      reload!(false) if respond_to?(:reload!)
      FactoryGirl.reload if defined?(FactoryGirl)
    end
    self.should_reload = false
  end

  def self.need_reload
    self.should_reload = true
  end
end

