Rails Env Switcher
===================

Rails Env Switcher allows your to switch from a rails environmemnt to another one.  
Best served chilled with [irb-config](https://github.com/nviennot/irb-config).

Why is it useful?
-----------------

We want to run tests from the rails console.

### Watch the screencast

[![Watch the screencast!](https://s3.amazonaws.com/velvetpulse/screencasts/irb-config-screencast.jpg)](http://velvetpulse.com/2012/11/19/improve-your-ruby-workflow-by-integrating-vim-tmux-pry/)

Usage
------

```ruby
gem 'rails-env-switcher'
```

If you have [Pry](https://github.com/pry/pry) installed, you will have access to the `env` command:


```
pafy@bisou ~/prj/rails-prj [master●] % rails c
Loading development environment (Rails 3.2.8)
~/prj/crowdtap/rails-prj (development) > env test
~/prj/crowdtap/rails-prj (test) > Rails.env
=> "test"
~/prj/crowdtap/rails-prj (test) > exit
~/prj/crowdtap/rails-prj (development) > Rails.env
=> "development"

```

Programmatically:

```ruby
RailsEnvSwitcher.with_env 'test', :reload => true do
  # Do some stuff in the test environment
  # reload => true means that we want to reload!
  # Leaving the block returns in the original environment
  # with_env is nestable
end

# You can also switch permantently with
RailsEnvSwitcher.switch_env 'staging'
```

TODO
----

* Middleware pattern
* Testing

License
-------

MIT License
