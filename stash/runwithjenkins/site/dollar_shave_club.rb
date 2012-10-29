require 'watir-page-helper'

module WatirPageHelper::Google

  def initialize(browser, env="production")
    @environment = get_environment(env)
  end


    def get_environment(env)
      #TODO: get environment data from environments.yml
    production = { :baseurl = "www.dollarshaveclub.com" }
    test = { :baseurl = "test.dollarshaveclub.com"}
    development = { :baseurl = "dev.dollarshaveclub.com" }

    case env
      when "production"
        return production
      when "test"
        return test
      when "development"
        return development
    end

  end
  
end