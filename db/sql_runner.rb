require( 'pg' )

class SqlRunner

  def self.run( sql, values )
    begin
      db = PG.connect({
        dbname: 'd9p85v8dotojtt',
        host: 'ec2-54-225-237-64.compute-1.amazonaws.com',
        port: 5432,
        user: 'fwjznujpjefxlb',
        password: '231a9ef429130c022a343623f63cb41801289bd061adc24ac626103dce83e671'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
