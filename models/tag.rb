require_relative('../db/sql_runner')
require_relative('vendor')
require_relative('transaction')

class Tag

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    user_data = SqlRunner.run(sql, values)
    @id = user_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags
    SET
    (
      name
      ) =
      (
        $1
      )
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM tags
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all()
      sql = "DELETE FROM tags"
      values = []
      SqlRunner.run( sql, values )

    end

    def self.all()
      sql = "SELECT * FROM tags"
      values = []
      tags = SqlRunner.run( sql, values )
      result = tags.map { |tag| Tag.new( tag ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM tags WHERE id = $1"
      values = [id]
      tag = SqlRunner.run( sql, values )
      result = UseTagr.new( tag.first )
      return result
    end

    # def vendors()
    #   sql = "SELECT vendors.* FROM vendors WHERE id = $1;"
    #   values = [@id]
    #   vendors = SqlRunner.run(sqxl, values)
    #   return vendors.map {|vendor| Vendor.new(vendor)}
    # end

    def transactions()
      sql = "SELECT transactions.* FROM transactions WHERE tag_id = $1;"
      values = [@id]
      transactions = SqlRunner.run(sql, values)
      return transactions.map {|transaction| Transaction.new(transaction)}
    end

  end
