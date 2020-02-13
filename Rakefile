ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'sinatra/flash'

desc "start a pry console"
task :console do
    Pry.start
end
