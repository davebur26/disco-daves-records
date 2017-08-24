require_relative( '../db/sql_runner' )

class Artist

  attr_accessor( :name)
  attr_reader ( :id )


  def initialize( details )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ($1,$2) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
