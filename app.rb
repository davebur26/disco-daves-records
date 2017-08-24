require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/artists_controller')

get '/' do
  erb( :index )
end
