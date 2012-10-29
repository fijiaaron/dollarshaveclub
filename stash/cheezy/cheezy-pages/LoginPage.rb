class LoginPage
	include PageObject

	text_field(:username, :id => 'username')
	text_field(:password, :id => 'password')
	button(:login, :id => 'login')

	def login_with(username, password)
		self.username = username
		self.password = password
		login
	end
end

browser = Watir::Browser.new :firefox
login_page = LoginPage.new(browser)

login_page.username = 'cheezy'
login_page.password = 'secret'
login_page.login
