class UsersController < ApplicationController

    get '/signup' do
        @households = Household.all
        erb :'users/signup'
    end
    
    post '/signup' do
        user = User.new(username: params["user"]["username"].strip, password: params["user"]["password"])
        if user.save
            session[:user_id]=user.id
            redirect to '/home'
        else
            flash[:error_message] = "You must enter a username and password, and your username must be unique."
            redirect to '/signup'
        end
    end

    get '/home' do 
        redirect_if_not_logged_in
        @user = User.find(current_user.id)
        @households = @user.households
        erb :'users/home'
    end

    get '/users/edit' do 
        redirect_if_not_logged_in
        @user = current_user
        @households = Household.all
        erb :'users/edit'
    end

    patch '/users/:id' do 
        user = User.find(params[:id])
        user.update(username: params["name"]) 
        if !params["user"]["household_ids"].empty?
            current_user.household_ids = params["user"]["household_ids"]
        end
        redirect to '/home'
    end

    delete '/users/:id/delete' do
        @user = User.find(params[:id])
        @user.delete
        redirect to '/' 
    end
end