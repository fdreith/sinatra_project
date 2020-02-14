class PetsController < ApplicationController

    get '/pets/new' do
        erb :'pets/new'
    end

    post '/pets' do
        @pet = Pet.create(
            name: params["pet"]["name"], 
            species: params["pet"]["species"], 
            household_id: params["user"]["household_id"]
            )
        if @pet.save
            redirect to "/households/#{params["user"]["household_id"]}"
        else
            flash[:error_message] = "A unique name is required to create a pet."
            redirect '/pets/new'
        end
    end

    get '/pets/:id/edit' do 
        @pet = Pet.find(params[:id])
        erb :'/pets/edit'
    end
    
    get '/pets/:id' do 
        @pet = Pet.find(params[:id])
        erb :'/pets/show'
    end

    patch '/pets/:id' do 
    
    end
    
end
