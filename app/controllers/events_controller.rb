class EventsController < ApplicationController

    get '/events' do
        @events = Event.all
        erb :'events/index'
    end

    get '/events/new' do
        erb :'events/new'
    end

    post '/events' do
        
    end

    get '/events/:id/edit' do 
        @event = Event.find(params[:id])
        erb :'/events/edit'
    end
    
    get '/events/:id' do 
        @event = Event.find(params[:id])
        erb :'/events/show'
    end

    patch '/events/:id' do 
    
    end
    
end