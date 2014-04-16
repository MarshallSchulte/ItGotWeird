json.array!(@blogs) do |blog|
  json.extract! blog, :userId, :title, :content
  json.url blog_url(blog, format: :json)
end