require 'watir-webdriver'
require 'watir-page-helper'

class LoginPage
	include WatirPageHelper

	@url_base = "http://www.dollarshaveclub.com"
	@path = "/customer/account/login/"

	def initialize(browser, visit = false)
		@browser = browser
		direct_url "#{@url_base}#{@path}"

		goto if visit
	end
