# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ItGotWeird.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  add '/home', :changefreq => 'yearly', :priority => 1.0
  add '/blogs', :changefreq => 'weekly', :priority => 0.9
  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at
  end
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
end
