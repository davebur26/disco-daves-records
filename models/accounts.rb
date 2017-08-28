require_relative( '../db/sql_runner' )
require_relative( './artist.rb' )

class Account

attr_accessor(:shop_name, :funds, :shopping_list)

  def initialize(details)
    @shop_name = details['shop_name']
    @funds = details['funds']
    @shopping_list = []
  end

  def save()
    sql = "INSERT INTO accounts(shop_name, funds) VALUES ($1,$2) RETURNING id"
    values = [@shop_name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM accounts"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map{ |account| Account.new(account) }
  end


  def add_to_shopping_list(album_title)
    binding.pry
    @shopping_list << album_title

  end


end
