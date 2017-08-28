require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/artists_controller')
require_relative( 'controllers/albums_controller')
require_relative( 'controllers/genres_controller')

also_reload ('./models*')



get '/home' do
  erb( :home )
end
