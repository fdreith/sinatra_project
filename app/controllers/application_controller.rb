require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    redirect to '/login'
  end

  get '/home' do 
    erb :'user_view/home'
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id]) #or :user_id
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/'
    end
  end

end
