require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :landing
  end

  post '/login' do
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      session[:user_id]=user.id
      redirect "/household"
    else
      erb :error
    end
  end

  get '/household' do 
    erb :household
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
