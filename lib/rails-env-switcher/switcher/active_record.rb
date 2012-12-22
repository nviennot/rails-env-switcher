module RailsEnvSwitcher::Switcher::ActiveRecord
  def self.switch_env(old_env, env, options={})
    if defined? ActiveRecord
      ActiveRecord::Base.clear_active_connections!
      ActiveRecord::Base.establish_connection
    end
  end
end
