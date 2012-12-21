module RailsEnvSwitcher::Switcher
  autoload :ActiveRecord,     'rails-env-switcher/switcher/active_record'
  autoload :Bundler,          'rails-env-switcher/switcher/bundler'
  autoload :CopycopterClient, 'rails-env-switcher/switcher/copycopter_client'
  autoload :Mongoid,          'rails-env-switcher/switcher/mongoid'
  autoload :Rails,            'rails-env-switcher/switcher/rails'
  autoload :Reloader,         'rails-env-switcher/switcher/reloader'
end
