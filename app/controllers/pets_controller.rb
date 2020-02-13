class PetsController < ApplicationController
    get '/pets' do
        @pet = Pet.all
        erb :'pets/index'
    end

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
