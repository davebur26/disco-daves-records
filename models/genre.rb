require_relative( '../db/sql_runner' )

class Genre

  attr_accessor( :name)
  attr_reader ( :id )


  def initialize( details )
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO genres(name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM genres"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{ |genre| Genre.new(genre) }
  end

  def self.find(id)
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql,values)
    result = Artist.new(genre[0])
    return result
  end

  def delete()
    sql = "DELETE FROM genres WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM genres;"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

end
