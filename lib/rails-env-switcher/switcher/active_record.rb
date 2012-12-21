module RailsEnvSwitcher::Switcher::ActiveRecord
  def self.switch_env(old_env, env)
    if ::ActiveRecord::Base.connected?
      ::ActiveRecord::Base.clear_cache! if ::ActiveRecord::Base.respond_to? :clear_cache
      ::ActiveRecord::Base.clear_all_connections!
      ::ActiveRecord::Base.establish_connection
    end
  end
end
