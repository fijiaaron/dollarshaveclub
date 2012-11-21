#load_home_page.rb

@smoketest
Feature: Load home page
	In order to view the Dollar Shave Club Website
	As a user
	I want to verify that the home page loads

	@homepage
	Scenario: home page title
		Given I have a browser open
		When I go to the dollarshaveclub "home" page
		Then I should see the title "Men's Razors, Buy Razor Blades Online | Dollar Shave Club"
