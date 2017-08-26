require_relative( '../db/sql_runner' )
require_relative( './artist.rb' )

class Album

  attr_accessor(:title, :artist_id, :quantity)
  attr_reader(:id, :artist_name)

  def initialize( details )
    @id = details['id'].to_i if details['id']
    @title = details['title'].capitalize
    @artist_id = details['artist_id']
    @quantity = details['quantity']
    @artist_name = Artist.find(artist_id).name
    @stock_level = stock_level()

  end

  def save()
    sql = "
      INSERT INTO albums(title,artist_id, quantity)
      VALUES ($1, $2, $3) RETURNING id
      "
    values = [@title, @artist_id, @quantity]
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
    sql = "UPDATE albums SET (title, artist_id, quantity) = ($1,$2,$3) WHERE id = $4"
    values = [@title, @artist_id, @quantity, @id]
    SqlRunner.run( sql, values )
  end

  def stock_level()
    return "High" if @quantity.to_i > 10
    return "Low" if @quantity.to_i < 5
    return "Medium"
  end

end
