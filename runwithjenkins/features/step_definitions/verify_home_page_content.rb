#verify_home_page_content.rb


Given /^I am on the dollarshaveclub\.com home page$/ do
  @browser = Watir::Browser.new
  @site = DollarShaveClub.new(@browser)
  @browser.goto url
end

When /^I check the page for logo$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the background: url\("(.*?)"\)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I check the page for video$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the iframe http:\/\/www\.youtube\.com\/embed\/ZUG(\d+)qYTJMsI\?rel=(\d+)&autohide=(\d+)&autoplay=(\d+)$/ do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end

When /^I check the page for login_link$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the Login https:\/\/www\.dollarshaveclub\.com\/customer\/account\/login$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I check the page for register_link$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the Register http:\/\/www\.dollarshaveclub\.com\/select\-blade$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I check the page for copyright$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
