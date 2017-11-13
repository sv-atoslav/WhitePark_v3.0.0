class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :divider_access
	WillPaginate.per_page = 5

	$HEROKU_LINK = 'https://shrouded-mountain-92881.herokuapp.com'

	def robots
	end

	def set_photo_list
		@photo_list = Photo.all.order(description: :asc)
	end

	# defense for unauthorized acces
	def divider_access
		info_about_wiever = " "
		if current_moderator.nil?
			info_about_wiever += "guest"
		else
			info_about_wiever += "moder "
			info_about_wiever += current_moderator.email
		end
		puts "current viever =" + info_about_wiever
		authenticate_moderator! unless moderator_signed_in? || controller_name == "guest_pages" || legaly_actions.include?(action_name)
	end

	def legaly_actions
		return ["beauty", "robots"]
	end

	private

	def self.smart_remove_spasebars(tall_string)
		tall_string.to_s
		tall_string.gsub!("  "," ") until tall_string.gsub!("  "," ").nil?
		# I can write
		# puts " " until tall_string.gsub!("  "," ").nil?
		# but now f(x) faster
		tall_string = tall_string[1..-1]  while tall_string[0]  == " "
		tall_string = tall_string[0...-1] while tall_string[-1] == " "
		return tall_string
	end
end