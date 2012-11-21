#dollarshaveclub_page.rb

class DollarShaveClubPage
	include PageObject

	@url_base = 'http://www.dollarshaveclub.com'

	def initialize(browser, environment)
		super(@browser)
	end
end