class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :divider_access
	# before_action :pust_info
	before_action :try_set_template
	WillPaginate.per_page = 10

	$HEROKU_LINK = 'https://shrouded-mountain-92881.herokuapp.com'

	def robots
	end

	def set_photo_list
		@photo_list = Photo.all.order(description: :asc)
	end

	def pust_info
		info_about_wiever = " "
		if current_moderator.nil?
			info_about_wiever += "guest"
		else
			info_about_wiever += "moder "
			info_about_wiever += current_moderator.email
		end
		puts "current viever =" + info_about_wiever
		puts controller_name 
		puts action_name
	end

	def try_set_template
		@a_n_index = action_name == "index"
		@a_n_edit  = action_name == "edit"
	end
	# defense for unauthorized acces
	def divider_access
		authenticate_moderator! unless moderator_signed_in? || controller_name == "guest_pages" || legaly_actions.include?(action_name)
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

	def legaly_actions
		return ["beauty", "robots"]
	end
end