#env.rb

### Environment variables used by this script:
#   DOLLARSHAVECLUB_TEST_ENVIRONMENT
#   DOLLARSHAVECLUB_TEST_DRIVER
#   DOLLARSHAVECLUB_TEST_HEADLESS
#   DOLLARSHAVECLUB_TEST_REMOTE
#   DOLLARSHAVECLUB_TEST_CONFIG

require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'


### define path constants
BASE_PATH    = File.join(File.dirname(__FILE__), "../../")
CONFIG_PATH  = BASE_PATH + 'config'
LIB_PATH     = BASE_PATH + 'lib'


### set working directory and include project specific dependencies
$: << LIB_PATH

require 'configuration.rb'
require 'site.rb'


## set configuration
# default_config_file = File.join(CONFIG_PATH) + '/config/setup.yml'
# config_file = (ENV['DOLLARSHAVECLUB_TEST_CONFIG'] || default_config_file)
# config = Configuration.load_file(config_file)
config = { :environment => 'production', :driver => 'firefox', :headless => false }


### create logger
log = Logger.new(STDOUT)


### set environment to test against
environments = [ :production, :test, :development ]
default_environment = 'production'
environment = (ENV['DOLLARSHAVECLUB_TEST_ENVIRONMENT'] || default_environment).to_sym

if environments.include? environment
  config[:environment] = environment
else
  message = 'invalid environment' + environment.to_s
  log.warn(message)
  throw message
end


### set webdriver browser to use
drivers = [ :firefox, :chrome, :ie, :safari, :webrat ]
default_driver = :firefox
driver = (ENV['DOLLARSHAVECLUB_TEST_DRIVER'] || default_driver).to_sym

if drivers.include? driver
  config[:driver] = driver
else
  message = 'invalid driversr' + driver.to_s
  log.warn(message)
  throw message
end


### set whether to use headless (xvfb)
headless = !!(ENV['DOLLARSHAVECLUB_TEST_HEADLESS'])


### set up remote server
# if ENV['DOLLARSHAVECLUB_TEST_REMOTE']
#   remote = Selenium::WebDriver::Remote::Http::Default.new
#   remote.timeout = 60
# end
# if remote
#   browser = Watir::Browser.new driver, :http_client => remote
# else
#   browser = Watir::Browser.new driver
# end


### create reusable browser instance
browser = Watir::Browser.new driver


### include page objects for site
World PageObject::PageFactory


### setup
Before do |scenario|
  if headless
    require 'headless'
    @headless = Headless.new
    @headless.start
  end

  @browser = browser

  @site = DollarShaveClub.new(@browser, config[:environment])
end


### teardown
After do |scenario|
  ### take a screenshot on failure
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  if scenario.failed?
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

  #@browser.close
end



### cleanup
at_exit do

  browser.close

  if @headless
    @headless.destroy
  end
end
