class GuestPagesController < ApplicationController
	
	layout "application_guest"
	
	def about_us
	end

	def contacts
	end

	def site_map
	end

	def main
		@main_slayder = Slayder.find_by(title: "главная")
		if !@main_slayder.nil?
			@main_photo_list = PhotoInSlayder.where(slyder: @main_slayder.id).to_a
		end
		@category_list = CategoryEvent.all
		exist_list(@main_photo_list)
	end

	def kitchen
		@kitchen_slayder = Slayder.find_by(title: "кухня")
		puts @kitchen_slayder
		@visible_part = !(@kitchen_slayder.nil?)
		puts @visible_part
		if @visible_part
			@kitchen_photo_list = PhotoInSlayder.where(slyder: @kitchen_slayder.id).to_a
			puts @kitchen_photo_list
			exist_list(@kitchen_photo_list)
		end
	end

	def review
		@opinion_list = Opinion.paginate(:page => params[:page])
		exist_list(@opinion_list)
	end

	def list_of_articles
		@article_list = Article.paginate(:page => params[:page])
		exist_list(@article_list)
	end

	def map_park
		@tent_list = Tent.all
		exist_list(@tent_list)
	end

	def eventlist
		@event_list = Event.paginate(:page => params[:page])
		exist_list(@event_list)
	end

	def download_menu
		send_file("#{Rails.root}/app/assets/otherfiles/menu2017.xlsx")
	end

	private

	def exist_list(list)
		@visible_part = (list.to_a.any?)
	end
end
