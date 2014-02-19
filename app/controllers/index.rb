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

post '/sign_up' do
  redirect to('/') if !validate_passwords(params[:password], params[:password_confirmation])
  user = User.create(name: params[:name], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect to "/user/#{params[:email]}"
end

post '/sign_in' do

end

get '/user/:username' do

  erb :user
end

post '/urls' do
  if Url.where(url: params[:url], user_id: nil).length == 0
    @short = gen_short_url
    Url.create(url: params[:url], short_url: @short)
  else
    @short = Url.where(url: params[:url], user_id: nil).first.short_url
  end
  redirect to("/show/#{@short}")
end

post '/user/url' do
  user = User.where(id: session[:user_id])
  if Url.where(url: params[:url], user_id: user.id)
end




