require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

# INDEX
get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index")
end

# NEW
get '/artist/new' do
  @artists = Artist.all
  erb( :"artists/new" )
end

# CREATE
post '/artists' do
  artist = Artist.new(params)
  artist.save
  redirect to ("/artists")
end

# SHOW
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb( :"artists/show" )
end

# DESTROY
post '/artists/:id/delete' do
  artist = Artist.find(params[:id])
  artist.delete()
  redirect to ("/artists")
end

# EDIT
get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :"artists/edit" )
end

# UPDATE
post '/artists/:id' do
  Artist.new( params ).update
  redirect to '/artists'
end

# SHOW ALBUM BY ARTIST
get '/artist/:id/albums' do
  @albums = Artist.albums_by_artist( params[:id] )
  erb(:"artists/albums_by_artist")
end
