class PetsController < ApplicationController

    get '/pets/new' do
        redirect_if_not_logged_in
        erb :'pets/new'
    end

    post '/pets' do
        @pet = Pet.create(
            name: params["pet"]["name"], 
            species: params["pet"]["species"], 
            household_id: params["pet"]["household_id"],
            owner_id: current_user.id
            )
        if @pet.save && params["pet"].has_key?("household_id")
            flash[:success_message] = "You successfully created a new pet!"
            redirect to "/home"
        elsif @pet.save && !params["pet"].has_key?("household_id")
            flash[:success_message] = "You successfully created a new pet, but they do not have a home! Edit Pet to assign them a home."
            redirect to "/home"
        else
            flash[:warning_message] = "A unique name is required to create a pet."
            redirect '/pets/new'
        end
    end
    
    get '/pets/:id' do 
        redirect_if_not_logged_in
        @pet = Pet.find(params[:id])
        if !!@pet.household
            @household = @pet.household
            @household_name = @household.name
        else 
            @household_name = "Homeless"
        end
        @events_today = @pet.events.map do |event| 
            event if event.date == Date.today
        end
        erb :'/pets/show'
    end

    get '/pets/:id/edit' do 
        redirect_if_not_logged_in
        @pet = Pet.find(params[:id])
        @household = @pet.household
        redirect_if_not_authorized(@pet.owner_id)
        erb :'/pets/edit'
    end

    patch '/pets/:id' do 
        pet = Pet.find(params[:id])
        pet.update(name: params["pet"]["name"], species: params["pet"]["species"])
        if params.include?(["pet"]["household_id".to_i])
            pet.update(household_id: params["pet"]["household_id"])
        end 
        flash[:success_message] = "Pet updated."
        redirect to "/pets/#{pet.id}"
    end

    delete '/pets/:id/delete' do
        @pet = Pet.find(params[:id])
        @pet.delete
        flash[:warning_message] = "Pet deleted."
        redirect to '/home' 
    end
    
end
