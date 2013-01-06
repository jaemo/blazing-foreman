Blazing Foreman
===============

Foreman recipes for [blazing](http://github.com/effkay/blazing)

Installation
------------

Add `gem 'blazing-foreman'` to your `Gemfile`

Usage
-----

Enable the recipes you want in your blazing configuration file. Options
can be provided in the recipe call or with the target method. Target
options have precedence over recipe options.

```ruby
# Deploy the processes
#
#   recipe :deploy_processes, [options]
#
# Options:
#
#   :rails_env (specify the rails environment)
#
# Example:

recipe :deploy_processes, :rails_env => 'production'

# Restart the processes
#
#   recipe :restart_processes, [options]
#
# Options:
#
#   :rails_env (specify the rails environment)
#
# Example:

recipe :restart_processes, :rails_env => 'production'
```

Authors
-------

Daniel Farrell ([@danielfarrell][])

License
-------

See the [MIT-LICENSE file](https://github.com/danielfarrell/blazing-foreman/blob/master/MIT-LICENSE)

[@danielfarrell]: https://github.com/danielfarrell
