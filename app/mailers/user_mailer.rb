class UserMailer < ActionMailer::Base
  default :from => "rGov team <help@rgov.in>"
  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Verify your email address")
  end	
  
  
  def reset_notification(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Reset your password")
  end
  
end
