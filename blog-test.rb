require "selenium-webdriver"
require "rspec"
require_relative "signup_page.rb"
require_relative "users_page.rb"

timestamp = Time.now.to_i
username = "user#{timestamp}"
email = "user#{timestamp}@test.com"
password = "password"
expected_banner_text = "Welcome to the alpha blog user#{timestamp}"

# TEST: sign up for blog
describe "Blog application" do
  describe "when signing up a new user" do
    it "creates a new user account successfully" do
      #@driver = Selenium::WebDriver.for :firefox
       @driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
      # Go to signup form
      @driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
      # Fill out and submit form
      signup = SignupPage.new(@driver)
      signup.enter_username(username)
      signup.enter_email(email)
      signup.enter_password(password)
      signup.submit_signup_form()
      # Confirm user is signed up successfully
      userpage = UsersPage.new(@driver)
      banner_text = userpage.get_banner_text()
      expect(banner_text).to eq(expected_banner_text) 
      @driver.quit
    end
  end
end
