Myapp::Application.routes.draw do

	devise_for 		:moderators, controllers: { 
	unlocks: 		'moderators/unlocks'		, 
	sessions: 		'moderators/sessions'		,
	passwords:		'moderators/passwords'		, 
	confirations: 	'moderators/confirations'	, 
	registrations:	'moderators/registrations'	, 
	# omniauth_callbacks: 'moderators/omniauth_callbacks', 
	}

	# You can have the root of your site routed with "root"
	root to: 'guest_pages#main'
	get 'robots.:format'=> 'application#robots', format: :text
	get 'robots'		=> 'application#robots', format: :text

	#get '/admin',	to: 'admin/dashboards#dashboard_1'
	get  "/admin",	to: "admin/dashboards#dashboard_white_park"
	post "/admin",	to: "admin/dashboards#dashboard_white_park"
	get  "/log_out",to: "admin/dashboards#log_out"
	# undefined method `moderator_root' for #<ActionDispatch::Routing::Mapper:0xb20f9aa8>
	# when uncommitted
	# moderator_root to: "admin/dashboards#dashboard_white_park"

	namespace :admin do
		resources :articles, :events, :category_events, :opinions, :photo_in_articles, :photo_in_events, :photo_in_slayders, :photos, :slayders, :tents, :users
	end

	get 'WhitePark',to: 'guest_pages#main'
	get 'otzivi',	to: 'guest_pages#review'
	post'otzivi',	to: 'guest_pages#review'
	get 'kuhnya',	to: 'guest_pages#kitchen'
	get 'karta',	to: 'guest_pages#map_park'
	get 'o_nas',	to: 'guest_pages#about_us'
	get 'sitemap',	to: 'guest_pages#site_map'
	get 'kontakti', to: 'guest_pages#contacts'
	get 'sobitia',	to: 'guest_pages#eventlist'
	get 'download', to: 'guest_pages#download_menu'
	get 'statii',	to: 'guest_pages#list_of_articles'


	get "events/:eng_title",			to: 'admin/events#beauty'
	get "articles/:eng_title",			to: 'admin/articles#beauty'
	get "category_events/:eng_title", 	to: 'admin/category_events#beauty'

	# I have ActionController::UrlGenerationError witout this line
	get  "admin/opinions/:id/public",	to: 'admin/opinions#become_public'

	post "admin/events/upload/new", 	to: 'admin/events#upload'
	post "admin/events/upload/:id", 	to: 'admin/events#upload'


	#'inbox' routes # all in down completed
	get  "admin/dashboards/dashboard_white_park"
	get  "admin/dashboards/change_defence_info"
	post "admin/dashboards/change_defence_info"

end
