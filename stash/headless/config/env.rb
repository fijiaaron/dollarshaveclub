#env.rb

if ENV['HEADLESS']
	require 'headless'
	headless = Headless.new
	headless.start
	at_exit do 
		headless.destroy
	end