#site.rb

Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }

require 'configuration'

class DollarShaveClub
	attr_accessor :base_url

	def initialize(browser, environment='production')
		@env = Configuration.load_environment(environment)
		@base_url = @env['url']

		@browser = browser		
	end
end