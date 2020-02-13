class UsersController < ApplicationController

    get '/users/home' do 
        erb :'users/home'
    end

end