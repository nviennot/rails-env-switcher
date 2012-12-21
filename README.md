Rails Env Switcher
===================

Rails Env Switcher allows your to switch from a rails environmemnt to another one.

If you have Pry installed, it will add a "env" command. Example:

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

Best served chilled with [irb-config](https://github.com/nviennot/irb-config).

TODO
----

Testing


License
-------

MIT License