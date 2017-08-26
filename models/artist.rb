require_relative( '../db/sql_runner' )

class Artist

  attr_accessor( :name, :url)
  attr_reader ( :id )


  def initialize( details )
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @url = details['url']
  end

  def save()
    sql = "INSERT INTO artists(name, url) VALUES ($1,$2) RETURNING id"
    values = [@name, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{ |artist| Artist.new(artist) }
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql,values)
    result = Artist.new(artist[0])
    return result
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists SET (name, url) = ($1, $2) WHERE id = $3"
    values = [@name, @url, @id]
    SqlRunner.run( sql, values )
  end

end
