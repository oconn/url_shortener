get '/' do
  erb :index
end

get '/show/:short_url' do
  redirect to('/') if Url.where(short_url: params[:short_url]).empty?
  @url = Url.where(short_url: params[:short_url]).first
  erb :short_url
end

# e.g., /q6bda
get '/:short_url' do
  redirect to('/') if Url.where(short_url: params[:short_url]).empty?
  @url = Url.where(short_url: params[:short_url]).first
  @url.counter += 1
  @url.save
  redirect to("#{@url.url}")
end

post '/urls' do
  if Url.where(url: params[:url]).length == 0
    @short = gen_short_url
    Url.create(url: params[:url], short_url: @short)
  else
    @short = Url.where(url: params[:url]).first.short_url
  end
  redirect to("/show/#{@short}")
end




