class HouseholdsController < ApplicationController
    # get '/households' do
    #     @household = Household.all
    #     erb :'households/index'
    # end

    get '/households/new' do
        @pets = Pet.all
        erb :'households/new'
    end

    post '/households' do
        @household = Household.create(params[:name])
    

        
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