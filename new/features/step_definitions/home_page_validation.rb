#home_page_validation.rb


Given /^I have a browser open$/ do
  if not @browser
		@browser = Watir::Browser.new
	end
end

When /^I go to the dollarshaveclub "(.*)" page$/ do |page_name|
	puts "page_name: #{page_name}"
	puts @site.name
	visit_page HomePage
end

Then /^I should see the title "(.*?)"$/ do |expected_title|
	on_page HomePage do |page|

	end

  
end


