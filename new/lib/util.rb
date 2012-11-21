#util.rb

module Util

	@log = log = Logger.new(STDOUT)
	log.debug('loading module: ' + __FILE__)

	def Util.load_config_file(filename)
		config = {}

		@log.debug "loading config file: #{filename}"

		begin 
			require 'yaml'
			config = YAML.load_file(filename)
		rescue
			@log.warn("Unable to load config file: " + filename)
		end

		return config
	end

	def Util.take_screenshot(browser, screenshot_dir, prefix=nil)
		Dir::mkdir(screenshot_dir) if not File.directory?(screenshot_dir)
		filename = "#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
		if prefix
			filename = prefix + "_" + filename
		end
		filename = File.join(screenshot_dir, filename)
		browser.driver.save_screenshot(filename)
		embed screenshot, 'image/png'
	end

end