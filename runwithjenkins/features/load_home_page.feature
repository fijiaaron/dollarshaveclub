Feature: Website availability
	In order to verify the Dollar Shave Club website is up
	As a user
	I want to check that the home page loads

Scenario: visit home page
	Given I have an open browser 
	When I go to the url "www.dollarshaveclub.com"
	Then I should see the title "Men's Razors, Buy Razor Blades Online | Dollar Shave Club"

