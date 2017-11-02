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
		@category_list = CategoryEvent.all
		try_set_slayder("main")
	end

	def kitchen
		try_set_slayder("kitchen")
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

	def try_set_slayder(name_of_action)
		@one_slayder = Slayder.find_by( title: Slayder.title_action_converter(name_of_action, false) )
		@photo_list_of_slayder = PhotoInSlayder.where(slyder: @one_slayder.id).order(updated_at: :asc).to_a unless @one_slayder.nil?
		exist_list(@photo_list_of_slayder)
	end

	def exist_list(list)
		@visible_part = list.to_a.any?
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