require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( 'controllers/artists_controller')
require_relative( 'controllers/albums_controller')
require_relative( 'controllers/genres_controller')

# also_reload ('./models*')



get '/' do
  erb( :home )
end
