class EventsController < ApplicationController

    get '/events' do
        redirect_if_not_logged_in
        @events = Event.all
        erb :'events/index'
    end

    get '/events/new' do
        redirect_if_not_logged_in
        erb :'events/new'
    end

    post '/events' do
        
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