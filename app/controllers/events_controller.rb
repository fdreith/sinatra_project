class EventsController < ApplicationController

    post '/events' do
        @event = Event.create(pet_id: params["pet_id"], event_type: params["event"], details: params["details"], owner_id: current_user.id)
        if @event.save 
            redirect to "/pets/#{params["pet_id"]}"
        else 
            flash[:error_message] = "You must include an event type, for example, 'feed'."
            redirect to "/pets/#{params["pet_id"]}"
        end
    end

    get '/events/:id/edit' do 
        redirect_if_not_logged_in
        @event = Event.find(params[:id])
        @pet = @event.pet
        erb :'/events/edit'
    end

    patch '/events/:id' do 
        @event = Event.find(params[:id])
        @event.update(event_type: params["event"], details: params["details"])  
        redirect to "/pets/#{@event.pet.id}"
    end

    delete '/events/:id/delete' do
        @event = Event.find(params[:id])
        @event.delete
        redirect to "/pets/#{@event.pet.id}"
    end
    
end