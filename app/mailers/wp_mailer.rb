class WpMailer < ApplicationMailer
	before_action :get_admin_email

	def welcome_email(user)
		@user = user
		@url  = '//localhost:3000'
		mail(to: @user.email, subject: 'Добро пожаловать!')
	end

	def say_about_new_opinion(n_p_o)
		@n_n_p_o = n_p_o # new not published opinion
		@url = '//localhost:3000/not_published_opinions'
		mail(to: @admin_email, subject: 'Новый отзыв про WhitePark')
	end
	private

	def get_admin_email
		@admin_email = 'sv7atoslav@gmail.com'
		from = @admin_email
	end
end
