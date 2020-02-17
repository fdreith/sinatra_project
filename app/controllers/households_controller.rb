class HouseholdsController < ApplicationController

    get '/households/new' do
        redirect_if_not_logged_in
        @households = Household.all
        erb :'households/new'
    end

    post '/households' do
        if !params["household"]["name"].empty?
            @household = Household.create(name: params["household"]["name"], owner_id: current_user.id)
            current_user.update(household_ids: current_user.household_ids.push(@household.id))
        else 
            flash[:warning_message] = "You must type in a unique name for your Household, or join an existing Household by checking the box of the Household you would like to join."
            redirect to '/households/new'
        end
        flash[:success_message] = "You successfully created a new Household."
        redirect to '/home'
    end

    get '/households/:id' do 
        redirect_if_not_logged_in
        @household = Household.find(params[:id])
        erb :'/households/show'
    end

    get '/households/:id/edit' do 
        redirect_if_not_logged_in
        @household = Household.find(params[:id])
        redirect_if_not_authorized(@household.owner_id)
        erb :'/households/edit'
    end

    patch '/households/:id' do 
        household = Household.find(params[:id])
        household.update(params["household"])  
        binding.pry
        flash[:success_message] = "Household Updated."
        redirect to '/home'
    end

    delete '/households/:id/delete' do
        @household = Household.find(params[:id])
        @household.delete
        flash[:warning_message] = "Household Deleted."
        redirect to '/home' 
    end

end