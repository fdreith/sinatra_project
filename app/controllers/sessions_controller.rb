class SessionsController < ApplicationController

    get '/login' do
        erb  :'sessions_view/login'
    end
    
    post '/login' do
        user = User.find_by(username: params["username"], password: params["password"]) #maybe params[:user][:password]
        if user && user.authenticate(params["username"]["password"])
            session[:user_id]=user.id
            redirect '/home'
        else
            erb :error
        end
    end

    post '/logout' do
        session.clear
        redirect to '/'
    end

    get '/signup' do
        erb :'sessions_view/signup'
    end
    
    post '/signup' do
        @user = User.new(username: params["username"], password: params["password"])
        @user.save
        session[:user__id] = @user.id

        redirect '/home'
    end

end
