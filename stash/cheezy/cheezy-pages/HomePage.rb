require "watir-webdriver"
require "page-object"

class HomePage 
	include PageObject

	expected_title = "Men's Razors, Buy Razor Blades Online | Dollar Shave Club"
	link(:login_link, :text => "Login")

	def initialize(browser, open=true)
		@browser = browser
		goto if open
	end
	

end

browser = Watir::Browser.new :chrome
home = HomePage.new(browser)

home.login_link