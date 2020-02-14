class UsersController < ApplicationController

    get '/signup' do
        @households = Household.all
        erb :'users/signup'
    end
    
    post '/signup' do
        user = User.new(username: params["user"]["username"], password: params["user"]["password"])
        if user.save
            session[:user_id]=user.id
            redirect to '/home'
        else
            erb :error
        end
    end

    get '/home' do 
        if logged_in? 
            user = User.find(current_user.id)
            @households = user.households
            erb :'users/home'
        else
            erb :error
        end
    end
end