require_relative('../db/sql_runner')
require_relative('vendor')
require_relative('transaction')

class Tag

  attr_accessor :t_name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @t_name = options['t_name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      t_name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@t_name]
    user_data = SqlRunner.run(sql, values)
    @id = user_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags
    SET
    (
      t_name
      ) =
      (
        $1
      )
      WHERE id = $2"
      values = [@t_name, @id]
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
      sql = "SELECT * FROM tags ORDER BY t_name"
      values = []
      tags = SqlRunner.run( sql, values )
      return tags.map { |t_name| Tag.new( t_name ) }
    end

    def self.find( id )
      sql = "SELECT * FROM tags WHERE id = $1"
      values = [id]
      tag = SqlRunner.run( sql, values )
      result = Tag.new( tag.first )
      return result
    end

    # def self.most_common_tag()
    #   sql = "SELECT tag_id, COUNT(tag_id)
    #   FROM transactions
    #   GROUP BY tag_id LIMIT 1"
    #   values = []
    #   vendors = SqlRunner.run(sql, values)
    #   return vendors.map {|vendor| Vendor.new(vendor)}
    # end

    def vendors()
      sql = "SELECT vendors.* FROM vendors WHERE id = $1;"
      values = [@id]
      vendors = SqlRunner.run(sqxl, values)
      return vendors.map {|vendor| Vendor.new(vendor)}
    end

    def transactions()
      sql = "SELECT transactions.* FROM transactions WHERE tag_id = $1;"
      values = [@id]
      transactions = SqlRunner.run(sql, values)
      return transactions.map {|transaction| Transaction.new(transaction)}
    end

  end
