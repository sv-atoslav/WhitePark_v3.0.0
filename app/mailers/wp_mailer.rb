class WpMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url  = $HEROKU_LINK + '/WhitePark'
		mail(to: @user.email, subject: 'Добро пожаловать!')
	end

	def say_about_new_opinion(one_opinion)
		@n_n_p_o = one_opinion # new (not published) opinion
		@url = $HEROKU_LINK + '/admin/opinions'
		mail(to: $ADMIN_EMAIL, subject: 'Новый отзыв про WhitePark')
	end
end
