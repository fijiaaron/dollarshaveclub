#dollar_shave_club.rb

require_relative '../lib/configuration'

class DollarShaveClub

	def initialize(config={})
		@config = config
		puts('config in initialize: ' + @config.inspect)

		#@env = Configuration.load_environment(:production)
		@env = Configuration.load_environment(@config[:environment])
		if (@env and @env.has_key?('url'))
			@base_url = @env['url']
		end
	end

end
