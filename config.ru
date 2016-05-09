require './config/environment'
require './app/controllers/application_controller'

use Rack::Static, :urls => ['/css'], :root => 'public'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride


run ApplicationController
use MoviesController
use UsersController
use SessionsController
