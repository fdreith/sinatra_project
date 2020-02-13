class HouseholdsController < ApplicationController

    get '/households/new' do
        @pets = Pet.all
        erb :'households/new'
    end

    post '/households' do
        household = Household.create(name: params[:name], owner_id: current_user[:id])
        # if household.save
            
    

    end

    get '/households/:id/edit' do 
        @household = Household.find(params[:id])
        erb :'/households/edit'
    end
    
    get '/households/:id' do 
        @household = Household.find(params[:id])
        erb :'/households/show'
    end

    patch '/households/:id' do 
    
    end
    
end