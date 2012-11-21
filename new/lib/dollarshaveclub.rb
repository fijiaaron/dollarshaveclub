#dollarshaveclub.rb

class DollarShaveClub

	def initialize(browser, environment)
		@browser = browser
		@environment = environment
	end

	def url_base
		@environment.url
	end

	def home_page 
		HomePage.new(@browser)
	end

	def name
		"Dollar Shave Club"
	end
end

Dir["#{File.dirname(__FILE__)}/dollarshaveclub/pages/*_page.rb"].each {|r| load r }

