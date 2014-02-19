get '/' do
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

post '/urls' do
  if Url.where(url: "http://google.com").length == 0
    @short = gen_short_url
  else
    @short = Url.where(url: "http://www.google.com").first.short_url
  end

  short_url = Url.gen_short_url
  # create a new Url
  # erb :index
end

