require_relative( '../models/artist.rb');
require_relative( '../models/album.rb');
require_relative( '../models/genre.rb');
require( 'pry-byebug' )

Album.delete_all()
Artist.delete_all()
Genre.delete_all()


artist1 = Artist.new({"name" => "The Foals", "url" => "https://cdn2.thelineofbestfit.com/images/remote/http_cdn2.thelineofbestfit.com/media/2013/02/foals.jpg"})
artist2 = Artist.new({"name" => "Foo Fighters", "url" => "http://louderthanwar.com/wp-content/uploads/2015/06/2015FooFighters_EM__017140115.jpg"})
artist3 = Artist.new({"name" => "Kasabian", "url" => "https://www.google.co.uk/search?q=kasabian&tbm=isch&source=lnms&sa=X&ved=0ahUKEwi-6dnS9vTVAhVFJ1AKHVKrCTEQ_AUIDCgD&biw=1920&bih=917&dpr=1#imgrc=E7DJ6EQVbBnzVM:"})
artist4 = Artist.new({"name" => "The Red Hot Chili Peppers", "url" => "http://mushroom.com/wp-content/uploads/2016/06/red-hot-chili-peppers.jpg"})
artist5 = Artist.new({"name" => "Arctic Monkeys", "url" => "http://antiketombe.clear.co.id/resources/images/base/tutup-tahun-arctic-monkeys-sebar-dokume-9fe003.jpg?20141228152746"})
artist6 = Artist.new({"name" => "Stereophonics", "url" => "https://pbs.twimg.com/media/DHwWW3DUAAALK8x.jpg"})

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
  "buy_cost" => 3.70,
  "mark_up" => 200,
  "url" => "https://images-na.ssl-images-amazon.com/images/I/51ohCVOH85L.jpg"})
album2 = Album.new({
  "title" => "total life forever",
  "artist_id" => artist1.id,
  "quantity" => 5,
  "genre_id" => genre1.id,
  "buy_cost" => 4.25,
  "mark_up" => 300,
  "url" => "https://images-na.ssl-images-amazon.com/images/I/51TIBJQyGeL.jpg"})
album3 = Album.new({
  "title" => "in your honour",
  "artist_id" => artist2.id,
  "quantity" => 2,
  "genre_id" => genre2.id,
  "buy_cost" => 3.50,
  "mark_up" => 150,
  "url" => "https://images-na.ssl-images-amazon.com/images/I/61g2eNbEH8L.jpg"})
album4 = Album.new({
  "title" => "sonic highways",
  "artist_id" => artist2.id,
  "quantity" => 9,
  "genre_id" => genre3.id,
  "buy_cost" => 3.99,
  "mark_up" => 175,
  "url" => "https://images-na.ssl-images-amazon.com/images/I/61jyVKWA5NL.jpg"})

  album1.save()
  album2.save()
  album3.save()
  album4.save()
