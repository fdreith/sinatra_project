require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride

use UsersController
use PetsController
use HouseholdsController
use SessionsController
use EventsController
run ApplicationController
