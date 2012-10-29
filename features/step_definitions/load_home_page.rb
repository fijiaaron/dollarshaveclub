#load_home_page.rb

Given /^I have an open browser$/ do
	if not @browser
		@browser = Watir::Browser.new
	end
end

When /^I go to the url "(.*?)"$/ do |url|
	@browser.goto url
end

Then /^I should see the title "(.*?)"$/ do |expected_title|
	puts @browser.title
	@browser.title == expected_title
end
