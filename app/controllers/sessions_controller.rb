class SessionsController < ApplicationController

    get '/login' do
        erb  :'sessions_view/login'
    end
    
    post '/login' do
        user = User.find_by(username: params["user"][":username"].strip) #OR params[:username]
        if user && user.authenticate(params["user"][":password"])
            session[:user_id]=user.id
            redirect to "/home"
        else
            erb :error
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end

end
