require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/accounts.rb' )

# INDEX
get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  erb( :"albums/index")
end

# new
get '/album/new' do
  @albums = Album.all()
  @artists = Artist.all()
  @genres = Genre.all()
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

# EDIT
get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  @genres = Genre.all()
  erb( :"albums/edit" )
end

# UPDATE
post '/albums/:id' do
  Album.new( params ).update
  redirect to '/albums'
end

# SELL/UPDATE
post '/albums/:id/sell' do
  @album = Album.find( params[:id] )
  if @album.quantity > 0
  @album.sell
  redirect to '/albums'
else
  erb( :"albums/no-stock")
end
end
