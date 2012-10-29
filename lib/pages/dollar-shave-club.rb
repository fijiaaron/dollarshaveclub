dollar-shave-club.rb

class DollarShaveClubPage
	include PageObject

	include DollarShaveClub.header
	include DollarShaveClub.footer

	attr_accessor :url

	expected_title 'Razors for Men, Buy Cheap Razor Blades Online | Dollar Shave Club'

end
