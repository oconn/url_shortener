get '/' do
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

post '/urls' do
  short_url = Url.gen_short_url
  # create a new Url
  # erb :index
end

