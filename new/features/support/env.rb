#env.rb

############################################################
# This file is read by cucumber and sets up the environment
#
# It does the following:
#   define path constants
#   add the lib directory to the $LOAD_PATH
#   include additional libraries
#   load configuration settings
#   set the environment to test against
#   optionally start headless GUI (xvfb)
#   launch a browser to test with
#    
# Environment variables used by this script:
#
# DOLLARSHAVECLUB_TEST_ENVIRONMENT     production, test, development
# DOLLARSHAVECLUB_TEST_BROWSER         firefox, chrome, ie, safari, webrat
# DOLLARSHAVECLUB_TEST_HEADLESS        true, false
#
# Default values are specified in config/settings.yml
#
############################################################

### create logger
log = Logger.new(STDOUT)



### define path constants
BASE_PATH    = File.expand_path( File.join(File.dirname(__FILE__), '../..'))
CONFIG_PATH  = BASE_PATH + '/config'
LIB_PATH     = BASE_PATH + '/lib'

log.debug("BASE_PATH: #{BASE_PATH}")
log.debug("CONFIG_PATH: #{CONFIG_PATH}")
log.debug("LIB_PATH: #{LIB_PATH}")



### add the lib directory to the $LOAD_PATH
$: << LIB_PATH

log.debug("$LOAD_PATH: #{$LOAD_PATH}".gsub(',', ",\n\t"))



### include additional libraries
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'dollarshaveclub'
require 'util'

World PageObject::PageFactory



### load configuration settings
environments = Util.load_config_file(CONFIG_PATH + '/environments.yml')
settings     = Util.load_config_file(CONFIG_PATH + '/settings.yml')

log.debug("environments: #{environments}")
log.debug("settings: #{settings}")



### set the environment to test against
environments = [ :production, :test, :development ]
default_environment = :production
environment = ENV['DOLLARSHAVECLUB_TEST_ENVIRONMENT'] || settings['environment'] || default_environment
environment = environment.to_sym

if environments.include? environment
	log.debug("environment: #{environment}")
else
	message = "invalid environment #{environment}"
	log.warn(message)
	throw message
end



### optionally start headless GUI (xvfb)
use_headless = ENV['DOLLARSHAVECLUB_TEST_HEADLESS'] || settings['headless'] || false
if use_headless == 'true' || use_headless == 'on' || use_headless == 'yes' || use_headless == 1
	use_headless = true
end

log.debug("headless : #{use_headless}")

if use_headless == true
	require 'headless'
	log.debug("starting headless ui")
	headless = Headless.new
	headless.start
end




### launch a browser to test with
browsers = [ :firefox, :chrome, :ie, :safari, :webrat ]
default_browser = :firefox
browser = ENV['DOLLARSHAVECLUB_TEST_BROWSER'] || settings['browser'] || default_browser
browser = browser.to_sym

if browsers.include? browser
	log.debug("browser: #{browser}")
else
	message = "invalid browser #{browser}"
	log.warn(message)
	throw message
end

log.debug("starting browser")

driver = Watir::Browser.new browser



### Setup before each test scenario
Before do |scenario|
	@log = log
	@log.debug("before scenario... #{scenario.title}")

	@browser = driver
	@browser.cookies.clear
	@site = DollarShaveClub.new(@browser, environment)
end



### Cleanup after each test scenario
After do |scenario|
	if scenario.failed?
		#take_screenshot()
	end
end


### Cleanup before exit
at_exit do
	if driver
		driver.close
	end

	if headless
		headless.destroy
	end
end