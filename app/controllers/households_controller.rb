class HouseholdsController < ApplicationController

    get '/households/new' do
        @households = Household.all
        erb :'households/new'
    end

    post '/households' do
        #params => {"user"=>{"household_ids"=>["1", "5", "6", "7", "8", "9"]}, "household"=>{"name"=>""}}
        if !params["user"]["household_ids"].empty?
            current_user.household_ids = params["user"]["household_ids"]
        end
        if !params["household"]["name"].empty?
            binding.pry
            @household = Household.create(name: params["household"]["name"], owner_id: current_user.id)
            current_user.household_ids << @household.id
            current_user.save
            # user_household = UserHousehold.create(user_id: current_user.id, household_id: @household.id)
        end

        redirect to '/home'

    end

    get '/households/:id' do 
        @household = Household.find(params[:id])
        erb :'/households/show'
    end

    get '/households/:id/edit' do 
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