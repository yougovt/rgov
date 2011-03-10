class UserMailer < ActionMailer::Base
  default :from => "rGov team <help@rgov.in>"
  
  # Email sent to get user after signup to verify their
  # email address
  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Verify your email address")
  end	
  
  # Email sent to when a user requests their password to be 
  # reset
  def reset_notification(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Reset your password")
  end
 
  # Email sent to get user to verify their email address 
  # after an RTI is submitted
  def request_email_verification(request)
  	@request = request
  	mail(:to => "#{request.first_name} <#{request.email}>", :subject => "Verify your email address")
  end
  
  def request_queued(request)
    @request = request
    # sending attachment as a link to the site instead
    # attachments["#{request.permalink}.pdf"] = File.read("#{Rails.root}/requests/#{request.id}-#{request.permalink}.pdf")
    mail(:to => "#{request.first_name} <#{request.email}>", :subject => "Your RTI is being processed: #{request.sub}")
  end

  def request_submitted(request)
    @request = request
    @agency = Page.find_by_id(@request.page_id)
    mail(:to => "#{request.first_name} <#{request.email}>", :subject => "Your RTI has been submitted: #{request.sub}")
  end
  
end
