#load_home_page.rb
require 'watir-webdriver'

expected_title = "Men's Razors, Buy Razor Blades Online | Dollar Shave Club"

Given /^I have an open browser$/ do
	@browser = Watir::Browser.new
end

When /^I go to the url "(.*?)"$/ do |url|
	@browser.goto url
end

Then /^I should see the title "(.*?)"$/ do |arg1|
	puts @browser.title
	@browser.title == expected_title
	
end


After do |scenario|
	@browser.close
end