ActionMailer::Base.smtp_settings = {
	:address		=> "smtp.gmail.com",
	:port			=> 587,
	:domain			=> "rgov.in",
	:user_name		=> "help@rgov.in",
	:password		=> "govster45",
	:authentication	=> "plain",
	:enable_starttls_auto => true
}

# set up external yml config file to change this for the environment
# ActionMailer::Base.default_url_option[:host] = "localhost:3000" if Rails.env.development?
# ActionMailer::Base.default_url_option[:host] = "www.rgov.in" if Rails.env.production?

# require the class from the /lib/ folder
require './lib/development_mail_interceptor.rb'
# intercept email in development mode
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
