require_relative( '../db/sql_runner' )
require_relative( './artist.rb' )
require_relative( './genre.rb' )

class Album

  attr_accessor(:title, :artist_id, :quantity, :genre_id, :buy_cost, :last_bought, :url, :mark_up, :genre_name)
  attr_reader(:id, :artist_name)

  def initialize( details )
    @id = details['id'].to_i if details['id']
    @title = details['title'].capitalize
    @artist_id = details['artist_id'].to_i
    @quantity = details['quantity'].to_i
    @artist_name = Artist.find(details["artist_id"]).name
    @genre_name = Genre.find(details["genre_id"].to_i).name
    @stock_level = stock_level()
    @genre_id = details['genre_id'].to_i
    @buy_cost = details['buy_cost'].to_f.round(2)
    @mark_up = details['mark_up'].to_i
    @url = details['url']
    @last_bought = details['last_bought']
  end

  def sell_price
    '%.2f' % (@buy_cost * ((@mark_up)*0.01))
  end

  def save()
    sql = "
      INSERT INTO albums
      (title, artist_id, quantity, genre_id, buy_cost, mark_up, last_bought, url)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id
      "
    values = [@title, @artist_id, @quantity, @genre_id, @buy_cost, @mark_up, @last_bought, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{ |album| Album.new(album) }
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql,values)
    result = Album.new(album[0])
    return result
  end

  def self.find_artist(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    albums = SqlRunner.run(sql,values)
    return albums.map{ |album| Album.new(album) }
    return result
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE albums SET
      (title,artist_id, quantity, genre_id, buy_cost, mark_up, url)
      = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
      values = [@title, @artist_id, @quantity, @genre_id, @buy_cost, @mark_up, @url, @id]
    SqlRunner.run( sql, values )
  end

  def sell()
    sql = "UPDATE albums SET
        (quantity, last_bought)
        = ($1, CURRENT_DATE) WHERE id = $2"
      values = [(@quantity - 1), @id]
    SqlRunner.run( sql, values )
  end


  def stock_level()
    return "High" if @quantity.to_i > 10
    return "Low" if @quantity.to_i < 5
    return "Medium"
  end


end
