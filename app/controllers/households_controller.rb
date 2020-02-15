class HouseholdsController < ApplicationController

    get '/households/new' do
        redirect_if_not_logged_in
        @households = Household.all
        erb :'households/new'
    end

    post '/households' do
        if !params["user"]["household_ids"].empty?
            current_user.household_ids = params["user"]["household_ids"]
        end
        if !params["household"]["name"].empty?
            @household = Household.create(name: params["household"]["name"], owner_id: current_user.id)
            current_user.update(household_ids: current_user.household_ids.push(@household.id))
        end

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
        erb :'/households/edit'
    end

    patch '/households/:id' do 
        household = Household.find(params[:id])
        household.update(params["household"])  
        redirect to '/home'
    end

    delete '/households/:id/delete' do
        @household = Household.find(params[:id])
        @household.delete
        redirect to '/home' 
    end

end