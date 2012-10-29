@smoketest
Feature: Website availability
	In order to verify the Dollar Shave Club website is up
	As a user
	I want to check that the home page loads

	@homepage
	Scenario: load home page
		Given I have an open browser 
		When I go to the url "www.dollarshaveclub.com"
		Then I should see the title "Men's Razors, Buy Razor Blades Online | Dollar Shave Club"


	@homepage @content @development
	Scenario Outline: verify home page content
		Given I am on the dollarshaveclub.com home page
		When I check the page for <element>
		Then I should see the <content>

		Examples:
		| element       | content                                                                     |
		| logo          | background: url("../images/logo.png")                                       |
		| video         | iframe http://www.youtube.com/embed/ZUG9qYTJMsI?rel=0&autohide=1&autoplay=0 |
		| login_link    | Login https://www.dollarshaveclub.com/customer/account/login                |
		| register_link | Register http://www.dollarshaveclub.com/select-blade                        |
		| copyright     | "©2012 Dollar Shave Club All Rights Reserved"                               |