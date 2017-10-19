class ApplicationMailer < ActionMailer::Base
	$ADMIN_EMAIL = "White Park <sv7atoslav@gmail.com>"
	default from: $ADMIN_EMAIL
	layout 'mailer'
end

