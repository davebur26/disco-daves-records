require_relative( '../db/sql_runner' )

class Album

  attr_accessor(:title, :artist_id, :quantity)
  attr_reader(:name)

  def initialize( details )
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @artist_id = details['artist_id']
    @quantity = details['quantity']
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

end
