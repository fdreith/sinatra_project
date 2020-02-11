class SessionsController < ApplicationController

    get '/login' do
        erb  :'sessions_view/login'
    end
    
    post '/login' do
        # {"user"=>{":username"=>"franky", ":password"=>"fredy"}}
        user = User.find_by(username: params[:user][:username], password: params[:user][:password]) #maybe params[:user][:password]
        if user && user.authenticate(params[:password])
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
        user = User.new(username: params[:username], password: params[:password])
        if user.save
            session[:user_id]=user.id
            redirect '/home'
        else
            erb :error
        end
    end

end
