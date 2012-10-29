#site-test.rb

require 'rspec'
require_relative '../../lib/site/dollar_shave_club'


site = DollarShaveClub.new
puts "site: " + site.inspect

config = {}
site = DollarShaveClub.new(config)
puts "site: " + site.inspect

config = { :environment => 'production' }
puts "config: " + config.inspect
site = DollarShaveClub.new(config)
puts "site: " + site.inspect
