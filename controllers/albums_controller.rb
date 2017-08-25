require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

# INDEX
get '/albums' do
  @albums = Album.all()
  erb( :"albums/index")
end


# DESTROY
post '/albums/:id/delete' do
  album = Album.find(params[:id])
  album.delete()
  redirect to ("/albums")
end
