#run-chrome.rb

require 'watir-webdriver'

browser = Watir::Browser.new :chrome
browser.goto "www.dollarshaveclub.com"
puts browser.title
browser.close