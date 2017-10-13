require_relative('../db/sql_runner')

class Vendor

  attr_accessor :shop_name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @shop_name = options['shop_name']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      shop_name,
      type
        )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@shop_name, @type]
    merchant_data = SqlRunner.run(sql, values)
    @id = merchant_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE merchants
    SET
    (
      shop_name,
      type
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@shop_name, @type, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM merchants
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all()
      sql = "DELETE FROM merchants"
      values = []
      SqlRunner.run( sql, values )

    end

    def self.all()
      sql = "SELECT * FROM merchants"
      values = []
      merchants = SqlRunner.run( sql, values )
      result = merchants.map { |shop| Merchant.new( shop ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM merchants WHERE id = $1"
      values = [id]
      shop = SqlRunner.run( sql, values )
      result = Merchant.new( shop.first )
      return result
    end

  end
