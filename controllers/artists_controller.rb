require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative( '../models/album.rb' )

# INDEX
get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index")
end

# NEW
get '/new_artist_genre' do
  @artists = Artist.all
  @genres = Genre.all

  erb( :new_artist_genre )
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
  artist_used = Album.find_artist(artist.id)
  if artist_used.empty?
    artist.delete()
    redirect to ("/artists")
  else
    erb(:"artists/no_albums")
end
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
  if @albums.empty?
  erb(:"artists/no_albums")
else
  erb(:"artists/albums_by_artist")
end
end
