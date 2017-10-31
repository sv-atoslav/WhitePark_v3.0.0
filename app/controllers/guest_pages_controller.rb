class GuestPagesController < ApplicationController
	before_action :try_create_opinion_from_guest, only: [:review]
	
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
		# puts @kitchen_slayder
		@visible_part = !(@kitchen_slayder.nil?)
		# puts @visible_part
		if @visible_part
			@kitchen_photo_list = PhotoInSlayder.where(slyder: @kitchen_slayder.id).to_a
			# puts @kitchen_photo_list
			exist_list(@kitchen_photo_list)
		end
	end

	def review
		@opinion_list = Opinion.where(published: true).paginate(:page => params[:page])
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

	def try_create_opinion_from_guest
		@message = "форма для отзыва "
		unless (params[:opinion].nil? || params[:opinion][:author].nil? || params[:opinion][:email].nil? || params[:opinion][:phone].nil? || params[:opinion][:visit].nil? || params[:opinion][:words].nil?)
			@message += "заполнена и отправлена на рассмотрение модератору."
			# validation
			correct = true
			if params[:opinion][:visit].to_date.future?
				@message = "дата посещения не может происходить в будущем"
				correct = false
			end
			# if correct && next_cond
			#	@message = "other message"
			#	correct = false
			# end
			if correct
				Opinion.CreateByGuest(params[:opinion][:author], params[:opinion][:email], params[:opinion][:phone], params[:opinion][:visit], params[:opinion][:words])
			end
		else
			@message += "дожна быть заполнена полностью."
		end
	end
end