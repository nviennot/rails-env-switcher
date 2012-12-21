module RailsEnvSwitcher::Switcher::Bundler
  def self.switch_env(old_env, env, options={})
    Bundler.require(env)
  end
end
