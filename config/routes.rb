Myapp::Application.routes.draw do

  devise_for        :moderators, controllers: { 
    unlocks:        'moderators/unlocks'		, 
    sessions:       'moderators/sessions'       ,
    passwords:      'moderators/passwords'      , 
    confirations:   'moderators/confirations'   , 
    registrations:  'moderators/registrations'  , 
    # omniauth_callbacks: 'moderators/omniauth_callbacks', 
  }

  # You can have the root of your site routed with "root"
  root to: 'guest_pages#main'
  get 'robots.:format' => 'application#robots', format: :text
  get 'robots' => 'application#robots', format: :text

  #get '/admin',  to: 'admin/dashboards#dashboard_1'
   get "/admin",  to: "admin/dashboards#dashboard_white_park"
  post "/admin",  to: "admin/dashboards#dashboard_white_park"
  #moderator_root to: "admin/dashboards#dashboard_white_park"

  namespace :admin do
    resources :articles, :events, :category_events, :not_published_opinions, :opinions, :photo_in_articles, :photo_in_events, :photo_in_slayders, :photos, :slayders, :tents, :users
  end

  get 'WhitePark',to: 'guest_pages#main'
  get 'otzivi',   to: 'guest_pages#review'
  get 'kuhnya',   to: 'guest_pages#kitchen'
  get 'map',      to: 'guest_pages#map_park'
  get 'o_nas',    to: 'guest_pages#about_us'
  get "sitemap",  to: 'guest_pages#site_map'
  get 'kontakti', to: 'guest_pages#contacts'
  get 'sobitia',  to: 'guest_pages#eventlist'
  get 'download', to: 'guest_pages#download_menu'
  get 'statii',   to: 'guest_pages#list_of_articles'

  #for correct work the last word need be = ApplicationController.word_to_see
  get ":eng_title",						to: 'admin/events#beauty'
  get "events/:id/prosmotr",			to: 'admin/events#beauty'
  get "articles/:id/prosmotr",			to: 'admin/articles#beauty'
  get "category_events/:id/prosmotr",	to: 'admin/category_events#beauty'

  #'inbox' routes # all in down completed
  get "admin/dashboards/dashboard_white_park"
  get "admin/dashboards/dashboard_1"
  get "admin/dashboards/dashboard_2"
  get "admin/dashboards/dashboard_3"
  get "admin/dashboards/dashboard_4"
  get "admin/dashboards/dashboard_4_1"
  get "admin/dashboards/dashboard_5"

  get "admin/layoutsoptions/index"
  get "admin/layoutsoptions/off_canvas"

  get "admin/graphs/flot"
  get "admin/graphs/morris"
  get "admin/graphs/rickshaw"
  get "admin/graphs/chartjs"
  get "admin/graphs/chartist"
  get "admin/graphs/peity"
  get "admin/graphs/sparkline"
  get "admin/graphs/c3charts"

  get "admin/mailbox/inbox"
  get "admin/mailbox/email_view"
  get "admin/mailbox/compose_email"
  get "admin/mailbox/email_templates"
  get "admin/mailbox/basic_action_email"
  get "admin/mailbox/alert_email"
  get "admin/mailbox/billing_email"

  get "admin/metrics/index"

  get "admin/widgets/index"

  get "admin/forms/basic_forms"
  get "admin/forms/advanced"
  get "admin/forms/wizard"
  get "admin/forms/file_upload"
  get "admin/forms/text_editor"
  get "admin/forms/autocomplete"
  get "admin/forms/markdown"

  get "admin/appviews/contacts"
  get "admin/appviews/profile"
  get "admin/appviews/profile_two"
  get "admin/appviews/contacts_two"
  get "admin/appviews/projects"
  get "admin/appviews/project_detail"
  get "admin/appviews/activity_stream"
  get "admin/appviews/file_menager"
  get "admin/appviews/vote_list"
  get "admin/appviews/calendar"
  get "admin/appviews/faq"
  get "admin/appviews/timeline"
  get "admin/appviews/pin_board"
  get "admin/appviews/teams_board"
  get "admin/appviews/social_feed"
  get "admin/appviews/clients"
  get "admin/appviews/outlook_view"
  get "admin/appviews/blog"
  get "admin/appviews/article"
  get "admin/appviews/issue_tracker"

  get "admin/pages/search_results"
  get "admin/pages/lockscreen"
  get "admin/pages/invoice"
  get "admin/pages/invoice_print"
  get "admin/pages/login"
  get "admin/pages/login_2"
  get 'admin/pages/login_white_park'
  get 'admin/pages/log_out'
  get "admin/pages/forgot_password"
  get "admin/pages/register"
  get "admin/pages/not_found_error"
  get "admin/pages/internal_server_error"
  get "admin/pages/empty_page"

  get "admin/miscellaneous/notification"
  get "admin/miscellaneous/nestablelist"
  get "admin/miscellaneous/timeline_second_version"
  get "admin/miscellaneous/forum_view"
  get "admin/miscellaneous/forum_post_view"
  get "admin/miscellaneous/google_maps"
  get "admin/miscellaneous/datamaps"
  get "admin/miscellaneous/social_buttons"
  get "admin/miscellaneous/code_editor"
  get "admin/miscellaneous/modal_window"
  get "admin/miscellaneous/validation"
  get "admin/miscellaneous/tree_view"
  get "admin/miscellaneous/chat_view"
  get "admin/miscellaneous/agile_board"
  get "admin/miscellaneous/diff"
  get "admin/miscellaneous/pdf_viewer"
  get "admin/miscellaneous/sweet_alert"
  get "admin/miscellaneous/idle_timer"
  get "admin/miscellaneous/spinners"
  get "admin/miscellaneous/spinners_usage"
  get "admin/miscellaneous/live_favicon"
  get "admin/miscellaneous/masonry"
  get "admin/miscellaneous/tour"
  get "admin/miscellaneous/loading_buttons"
  get "admin/miscellaneous/clipboard"
  get "admin/miscellaneous/text_spinners"
  get "admin/miscellaneous/truncate"
  get "admin/miscellaneous/password_meter"
  get "admin/miscellaneous/i18support"

  get "admin/uielements/typography"
  get "admin/uielements/icons"
  get "admin/uielements/draggable_panels"
  get "admin/uielements/resizeable_panels"
  get "admin/uielements/buttons"
  get "admin/uielements/video"
  get "admin/uielements/tables_panels"
  get "admin/uielements/tabs"
  get "admin/uielements/notifications_tooltips"
  get "admin/uielements/helper_classes"
  get "admin/uielements/badges_labels_progress"

  get "admin/gridoptions/index"

  get "admin/tables/static_tables"
  get "admin/tables/data_tables"
  get "admin/tables/foo_tables"
  get "admin/tables/jqgrid"

  get "admin/commerce/products_grid"
  get "admin/commerce/products_list"
  get "admin/commerce/product_edit"
  get "admin/commerce/product_detail"
  get "admin/commerce/orders"
  get "admin/commerce/cart"
  get "admin/commerce/payments"

  get "admin/gallery/basic_gallery"
  get "admin/gallery/slick_carusela"
  get "admin/gallery/bootstrap_carusela"

  get "admin/cssanimations/index"

  get "admin/landing/index"

end
