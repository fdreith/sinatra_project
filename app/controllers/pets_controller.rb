class PetsController < ApplicationController

    get '/pets/new' do
        erb :'pets/new'
    end

    post '/pets' do
        
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
