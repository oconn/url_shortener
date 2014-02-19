get '/' do
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

post '/urls' do
  puts params
  # create a new Url
  # erb :index
end

