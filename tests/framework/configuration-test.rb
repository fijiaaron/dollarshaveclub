#configuration-test.rb

require_relative '../../lib/configuration'



env = Configuration.load_environment('production')
puts env.inspect

env = Configuration.load_environment(:production)
puts env.inspect

env = Configuration.load_environment(:test)
puts env.inspect


env = Configuration.load_environment(:development)
puts env.inspect


env = Configuration.load_environment(:bogus)
puts env.inspect