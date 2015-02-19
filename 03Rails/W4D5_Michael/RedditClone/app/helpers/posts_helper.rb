module PostsHelper
  def http_trimmer(url)
    url.gsub("http://", "")
  end
end
