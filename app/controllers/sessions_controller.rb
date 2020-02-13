class SessionsController < ApplicationController

    get '/login' do
        erb  :'sessions_view/login'
    end
    
    post '/login' do
        user = User.find_by(username: params["user"][":username"]) #OR params[:username]
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

    get '/signup' do
        @households = Household.all
        erb :'sessions_view/signup'
    end
    
    post '/signup' do
        @user = User.new(username: params["user"]["username"], password: params["user"]["password"], household_id: ["user"]["household_id".to_i])
        if user.save
            session[:user_id]=user.id
            redirect to '/home'
        else
            erb :error
            redirect to '/signup'
        end
    end

end
