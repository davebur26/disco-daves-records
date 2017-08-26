require_relative( '../models/artist.rb');
require_relative( '../models/album.rb');
require_relative( '../models/genre.rb');
require( 'pry-byebug' )

Album.delete_all()
Artist.delete_all()
Genre.delete_all()

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

genre1 = Genre.new({"name" => "Rock"})
genre2 = Genre.new({"name" => "Pop"})
genre3 = Genre.new({"name" => "Jazz"})
genre4 = Genre.new({"name" => "Alternative"})
genre5 = Genre.new({"name" => "Classical"})
genre6 = Genre.new({"name" => "Reggae"})

genre1.save()
genre2.save()
genre3.save()
genre4.save()
genre5.save()
genre6.save()

album1 = Album.new({
  "title" => "what went down",
  "artist_id" => artist1.id,
  "quantity" => 4,
  "genre_id" => genre6.id,
  "buy_cost" => 2,
  "sell_price" => 9,
  "last_bought" => '01-10-14',
  "url" => "https://images-na.ssl-images-amazon.com/images/I/51ohCVOH85L.jpg"})
album2 = Album.new({
  "title" => "total life forever",
  "artist_id" => artist1.id,
  "quantity" => 5,
  "genre_id" => genre1.id,
  "buy_cost" => 4,
  "sell_price" => 8,
  "last_bought" => '12-03-16',
  "url" => "https://images-na.ssl-images-amazon.com/images/I/51TIBJQyGeL.jpg"})
album3 = Album.new({
  "title" => "in your honour",
  "artist_id" => artist2.id,
  "quantity" => 2,
  "genre_id" => genre2.id,
  "buy_cost" => 2,
  "sell_price" => 9,
  "last_bought" => '12-03-13',
  "url" => "https://images-na.ssl-images-amazon.com/images/I/61g2eNbEH8L.jpg"})
album4 = Album.new({
  "title" => "sonic highways",
  "artist_id" => artist2.id,
  "quantity" => 9,
  "genre_id" => genre3.id,
  "buy_cost" => 2,
  "sell_price" => 9,
  "last_bought" => '24-08-17',
  "url" => "https://images-na.ssl-images-amazon.com/images/I/61jyVKWA5NL.jpg"})
  
  album1.save()
  album2.save()
  album3.save()
  album4.save()
