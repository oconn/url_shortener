get '/' do
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  @full_site = Url.where(short_url: params[:short_url]).first.url )
  erb :short_url
  # erb :index
  # redirect to appropriate "long" URL
end

post '/urls' do
  if Url.where(url: params[:url]).length == 0
    @short = gen_short_url
    Url.create(url: params[:url], short_url: @short)
  else
    @short = Url.where(url: params[:url]).first.short_url
  end
  redirect to("/#{@short}")
end

