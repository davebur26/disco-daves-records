require( 'sinatra' )
require( 'sinatra/contrib/all' )


# INDEX
get '/genres' do
  @genres = Genre.all()
  erb ( :"genres/index")
end

# NEW
get '/genre/new' do
  @genres = Genre.all
  erb( :"genres/new" )
end

# CREATE
post '/genres' do
  genre = Artist.new(params)
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
  genre.delete()
  redirect to ("/genres")
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
  erb(:"genres/albums_by_genre")
end
