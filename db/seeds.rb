require_relative( '../models/artist.rb');
require_relative( '../models/album.rb');
require( 'pry-byebug' )

Artist.delete_all()

artist1 = Artist.new({"name" => "The Foals"})
artist2 = Artist.new({"name" => "Foo Fighters"})
artist3 = Artist.new({"name" => "Kasabian"})
artist4 = Artist.new({"name" => "The Red Hot Chili Peppers"})
artist5 = Artist.new({"name" => "Arctic Monkeys"})
artist6 = Artist.new({"name" => "Stereophonics"})

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()

album1 = Album.new({
  "title" => "what went down",
  "artist_id" => artist1.id,
  "quantity" => 4})
album2 = Album.new({
  "title" => "total life forever",
  "artist_id" => artist1.id,
  "quantity" => 5})
album3 = Album.new({
  "title" => "in your honour",
  "artist_id" => artist2.id,
  "quantity" => 2})
album4 = Album.new({
  "title" => "sonic highways",
  "artist_id" => artist2.id,
  "quantity" => 9})

  album1.save()
  album2.save()
  album3.save()
  album4.save()
