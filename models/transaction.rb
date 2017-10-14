require_relative('../db/sql_runner')
require_relative('tag')
require_relative('vendor')

class Transaction

  attr_accessor :tag_id, :vendor_id, :amount, :transaction_date
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @tag_id = options['tag_id'].to_i
    @vendor_id = options['vendor_id'].to_i
    @amount = options['amount'].to_i
    @transaction_date = options['transaction_date']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      tag_id,
      vendor_id,
      amount,
      transaction_date
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@tag_id, @vendor_id, @amount, @transaction_date]
    transaction_data = SqlRunner.run(sql, values)
    @id = transaction_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      tag_id,
      vendor_id,
      amount,
      transaction_date
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@tag_id, @vendor_id, @amount, @transaction_date, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all()
      sql = "DELETE FROM transactions"
      values = []
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      values = []
      transactions = SqlRunner.run( sql, values )
      return transactions.map { |transaction| Transaction.new( transaction ) }
    end

    def self.find( id )
      sql = "SELECT * FROM transactions WHERE id = $1"
      values = [id]
      transactions = SqlRunner.run( sql, values )
      result = Transaction.new( transactions.first )
      return result
    end


    def vendor()
      sql = "SELECT * FROM vendors
      WHERE id = $1"
      values = [@vendor_id]
      results = SqlRunner.run( sql, values )
      return Vendor.new( results.first )
    end

    def tag()
      sql = "SELECT * FROM tags
      WHERE id = $1"
      values = [@tag_id]
      results = SqlRunner.run( sql, values )
      return Tag.new( results.first )
    end

    def self.total()
      sql = "SELECT SUM(amount) FROM transactions"
      values = []
      transactions = SqlRunner.run( sql, values )
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return transactions[0].values.first.to_i
    end

    def self.totals()
      sql = "SELECT SUM(transactions.amount) FROM transactions
      JOIN tags
      ON tags.id = transactions.tag_id
      WHERE tags.id = $1;"
      values = [@id]
      transactions = SqlRunner.run( sql, values )
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return transactions[0]
    end

    # def self.totals1()
    #   sql = "SELECT SUM(transactions.amount)
    #   FROM transactions
    #   GROUP BY transactions.amount ORDER BY transactions.amount DESC LIMIT 3"
    #   values = []
    #   transactions = SqlRunner.run( sql, values )
    #   result = transactions.map { |transaction| Transaction.new( transaction ) }
    #   return transactions.first
    # end

    def self.grouped_cost()
      sql = "SELECT SUM(transactions.amount)
      FROM transactions
      JOIN tags
      ON tags.id = transactions.tag_id
      GROUP BY tags.t_name ORDER BY tags.t_name LIMIT 1;"
      values = []
      transactions = SqlRunner.run( sql, values )
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return transactions.first
    end

    # SELECT tags.t_name, COUNT(transactions.amount)
    # FROM tags, transactions
    # GROUP BY tags.t_name
    #
    # SELECT transactions.amount SUM()
    # FROM transactions
    # GROUP BY transactions.amount;

    def self.most_common_tag()
      sql = "SELECT tags.t_name, COUNT(transactions.tag_id)
      FROM transactions
      JOIN tags
      ON tags.id = transactions.tag_id
      GROUP BY tags.t_name
      ORDER BY COUNT(transactions.tag_id) DESC LIMIT 1"
      values = []
      transactions = SqlRunner.run(sql, values)
      # return transactions.map {|transaction| Transaction.new(transaction)}
      return transactions[0].values.first
    end

    def self.most_spent_on()
      sql = "SELECT tags.t_name, COUNT(transactions.tag_id)
      FROM transactions
      JOIN tags
      ON tags.id = transactions.tag_id
      GROUP BY tags.t_name
      ORDER BY SUM(transactions.amount) DESC LIMIT 1"
      values = []
      transactions = SqlRunner.run(sql, values)
      # return transactions.map {|transaction| Transaction.new(transaction)}
      return transactions[0].values.first
    end

    # def cash_per_item()
    #   sql = "SELECT tags.id COUNT(transactions.amount)
    #   FROM transactions
    #   JOIN tags
    #   ON "
    #
    # end

    # def self.most_spent_on_cash_count()
    #   sql = "SELECT tags.t_name, transactions.amount
    #   FROM transactions
    #   JOIN tags
    #   ON tags.id = transactions.tag_id
    #   GROUP BY tags.t_name
    #   ORDER BY SUM(transactions.amount) DESC LIMIT 1"
    #   values = []
    #   transactions = SqlRunner.run(sql, values)
    #   # return transactions.map {|transaction| Transaction.new(transaction)}
    #   return transactions[0]
    # end

  end
