class SessionsController < ApplicationController

    get '/login' do
        erb  :'sessions_view/login'
    end
    
    post '/login' do
        user = User.find_by(username: params["user"][":username"].strip)
        if user && user.authenticate(params["user"][":password"])
            session[:user_id]=user.id
            redirect to "/home"
        else
            flash[:warning_message] = "Incorrect Username or Password."
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end

end
