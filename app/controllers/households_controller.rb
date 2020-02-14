class HouseholdsController < ApplicationController

    get '/households/new' do
        @households = Household.all
        erb :'households/new'
    end

    post '/households' do
        if !params["household"]["name"].empty?
            household = Household.create(name: params["household"]["name"], owner_id: current_user.id)
        end
        
        redirect to "/households/#{params[:id]}"
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
        household.update(params["household"])   #pets as a stretch goal)
        redirect to '/home'

    #     #stretch updating pets:
    #     # if !params[:household].keys.include?("pet_ids")
    #     #     params[:household]["pet_ids"] = []
    #     #   end
      
    #     #   @household = Household.find(params[:id])
    #     #   @household.update(params["household"])
    #     #   if !params["pet"]["name"].empty?
    #     #     @household.pets << Pet.create(name: params["pet"]["name"])
    #     #   end
    end
    

    
end