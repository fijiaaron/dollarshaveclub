#site-spec.rb

require_relative '../../lib/site/dollar_shave_club'
require_relative '../../lib/configuration'


describe DollarShaveClub, 'the site object' do
	
	describe 'config' do
		# @environments = [
		# 		:production  => { :base_url => 'http://www.dollarshaveclub.com' } ,
		# 		:test        => { :base_url => 'http://test.dollarshaveclub.com' },
		# 		:development => { :base_url => 'http://dev.dollarshaveclub.com' }
		# ]

		@environments = Configuration.load_config_file('../../config/environments.yml')			
		@environments.each do |env|
			puts "env: " + env.inspect
			it 'should set the base_url based on the environment' do 				
				@config = { :environment => env[0] }
				puts 'config: ' + @config.inspect

				site = DollarShaveClub.new(@config)
				puts site.base_url
			end
		end

		
	end

end