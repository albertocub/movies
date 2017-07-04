class UserNotifierMailer < ApplicationMailer
  default :from => 'Coordinador'
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'First Email. Thanks for signing up for our amazing app' )
  end
  def send_signup_email_second(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Second Email. Thanks for signing up for our amazing app' )
  end
  def send_signup_email_third(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Third Email. Thanks for signing up for our amazing app' )
  end
end
