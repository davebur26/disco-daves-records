require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative( '../models/genre.rb' )
# require_relative( '../models/album.rb' )

# INDEX
get '/genres' do
  @genres = Genre.all()
  erb ( :"genres/index")
end

# NEW
get '/new_artist_genre' do
  @genres = Genre.all
  erb( :new_artist_genre  )
end

# CREATE
post '/genres' do
  genre = Genre.new(params)
  genre.save
  redirect to ("/genres")
end

# SHOW
get '/genres/:id' do
  @genre = Genre.find(params[:id])
  erb( :"genres/show" )
end

# DESTROY
post '/genres/:id/delete' do
  genre = Genre.find(params[:id])
  genre_used = Album.find_genre(genre.id)
  if genre_used.empty?
    genre.delete()
    redirect to ("/genres")
  else
    erb(:no_delete)
  end
end

# EDIT
get '/genres/:id/edit' do
  @genre = Genre.find( params[:id] )
  erb( :"genres/edit" )
end

# UPDATE
post '/genres/:id' do
  Genre.new( params ).update
  redirect to '/genres'
end

# SHOW ALBUM BY GENRE
get '/genres/:id/albums' do
  @albums = Genre.albums_by_genre( params[:id] )
  if @albums.empty?
  erb(:"genres/no_albums")
else
  erb(:"genres/albums_by_genre")
end
end
