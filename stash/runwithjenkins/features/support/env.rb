#env.rb

require 'watir-webdriver'
require 'page-object'

## run headless
# :headless => 'headless'


## specify browser
# :chrome => 'chrome'
# :firefox => 'firefox'
# :ie => 'ie'
# :safar => 'safari'
# :webrat => 'webrat'

$: << File.dirname(__FILE__) + '/../../lib'

require 'site.rb'

World PageObject::PageFactory

Before ('@browser') do
  if ENV['HEADLESS'] == true
    require 'headless'
    @headless = Headless.new
    @headless.start
  end
end

Before 


  if browser == 'CHROME'
    # gem install chromedriver-helper
    # https://github.com/flavorjones/chromedriver-helper
    require 'watir-webdriver'
    @browser = Wa
  elsif browser == 'FIREFOX'
    require 'watir-webdriver'
  elsif browser == 'SAFARI'
    require 'safariwatir'
    # require 'watir-webdriver'
    # see safari webdriver setup at:
    # http://watirmelon.com/2012/04/17/using-watir-webdriver-with-safari-at-last/
  elsif browser == 'IE' or browser == 'INTERNET_EXPLORER'
    require 'watir'
  end
end

After do
  @browser.close
end


After ('@browser') do 
  if @headless.present?
    @headless.destroy
  end
end
