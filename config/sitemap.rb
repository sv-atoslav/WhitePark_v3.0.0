# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://shrouded-mountain-92881.herokuapp.com"

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/WhitePark'
  add '/otzivi'
  add '/kuhnya'
  add '/map'
  add '/o_nas'
  add '/kontakti'
  add '/sobitia'
  add '/download'
  add '/statii'
  add "/sitemap"

  Article.find_each do |state|
    way  = "articles/"
    way += state.eng_title.to_s
    add way, :lastmod => state.updated_at
  end
  Event.find_each do |state|
    way  = "events/"
    way += state.eng_title.to_s
    add way, :lastmod => state.updated_at
  end
  CategoryEvent.find_each do |state|
    way  = "category_events/"
    way += state.eng_title.to_s
    add way, :lastmod => state.updated_at
  end
end
