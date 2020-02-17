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
            flash[:warning_message] = "You must enter a username and password, and your username must be unique."
            redirect to '/signup'
        end
    end

    get '/home' do 
        redirect_if_not_logged_in
        @user = User.find(current_user.id)
        @households = @user.households
        @pets = Pet.where(owner_id: @user.id)
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
        if params.include?(["user"]["household_ids".to_i])
            current_user.household_ids = params["user"]["household_ids"]
        else
            current_user.household_ids = []
            flash[:warning_message] = "You have removed all of your Households."
            redirect to '/home'
        end
        flash[:success_message] = "You sucessfully updated your Households."
        redirect to '/home'
    end

    delete '/users/:id/delete' do
        @user = User.find(params[:id])
        @user.delete
        flash[:warning_message] = "You have deleted your account."
        redirect to '/' 
    end
end