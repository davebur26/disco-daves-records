require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )

# INDEX
get '/albums' do
  @albums = Album.all()
  @artists = Artist.all
  erb( :"albums/index")
end

# new
get '/album/new' do
  @albums = Album.all
  @artists = Artist.all
  erb( :"albums/new" )
end

# CREATE
post '/albums' do
  album = Album.new(params)
  album.save
  redirect to ("/albums")
end


# SHOW
get '/albums/:id' do
  @album = Album.find(params[:id])
  erb( :"albums/show" )
end

# DESTROY
post '/albums/:id/delete' do
  album = Album.find(params[:id])
  album.delete()
  redirect to ("/albums")
end
