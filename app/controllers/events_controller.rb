class EventsController < ApplicationController

    post '/events' do
        @event = Event.create(pet_id: params["pet_id"], event_type: params["event"])
        redirect to "/pets/#{params["pet_id"]}"
    end

    get '/events/:id/edit' do 
        redirect_if_not_logged_in
        @event = Event.find(params[:id])
        erb :'/events/edit'
    end
    
    get '/events/:id' do 
        redirect_if_not_logged_in
        @event = Event.find(params[:id])
        erb :'/events/show'
    end

    patch '/events/:id' do 
        event = Event.find(params[:id])
        event.update()  
        redirect to "/events/#{event.id}"
    end

    delete '/events/:id/delete' do
        @event = Event.find(params[:id])
        @event.delete
        redirect to '/home' 
    end
    
end