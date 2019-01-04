class SignupPage

  # css selectors go here as constants
  USERNAME_FIELD = {id: 'user_username'}
  EMAIL_FIELD = {id: 'user_email'}
  PASSWORD_FIELD = {id: 'user_password'}
  SIGNUP_BUTTON = {id: 'submit'}

  # this creates a read only variable for use throughout the class - under the hood, it creates an accessor method
  # the colon in ruby creates a symbol (immutable, similar to an enum)
  attr_reader :driver

  def initialize(driver)
    # instance variable that we can access outside of this function scope
    @driver = driver
  end

  def enter_username(username)
    username_field = @driver.find_element(USERNAME_FIELD)
    username_field.send_keys(username)
  end
  
  def enter_email(email)
    email_field = @driver.find_element(EMAIL_FIELD)
    email_field.send_keys(email)
  end
  
  def enter_password(password)
    password_field = @driver.find_element(PASSWORD_FIELD)
    password_field.send_keys(password)
  end
  
  def submit_signup_form()
    sign_up_button = @driver.find_element(SIGNUP_BUTTON)
    sign_up_button.click
  end
  
end
