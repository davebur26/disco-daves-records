require_relative( '../db/sql_runner' )

class Artist

  attr_accessor( :name)
  attr_reader ( :id )


  def initialize( details )
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{ |artist| Artist.new() }
  end


end
