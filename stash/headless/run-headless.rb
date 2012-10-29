#run-headless.rb

require 'watir-webdriver'
require 'headless'

headless = Headless.new
headless.start

browser = Watir::Browser.new
browser.goto 'www.dollarshaveclub.com'
puts browser.title

browser.close
headless.destroy