ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "mydomain.net",
    :user_name => ENV['MAILER_USERNAME'],
    :password => ENV['MAILER_PASSWORD'],
    :authentication => "plain",
    :enable_starttls_auto => true
}