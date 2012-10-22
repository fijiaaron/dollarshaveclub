require 'watir-webdriver'
require 'watir-page-helper'

class HomePage
  include WatirPageHelper

  @url_base = "http://www.dollarshaveclub.com"
  @path = "/"

  direct_url "#{@url_base}#{@path}"

  expected_element(:link, :text => "Login")
  expected_title("Men's Razors, Buy Razor Blades Online | Dollar Shave Club")

  link(:login_link, :text => "Login")

  def initialize(browser, visit = false)
    @browser = browser
    goto if visit

    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
  end


  def self.url_for_environment(environment) 
    puts "url_for_environment"

    env = {
      :production => "http://www.dollarshaveclub"
    }

    puts env[environment]
    return env[environment]
  end

end

browser = Watir::Browser.new :chrome
page = HomePage.new browser, true
page.login_link