require_relative('../db/sql_runner')

class Transaction

  attr_accessor :tag_id, :vendor_id, :amount, :transaction_date
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @tag_id = options['tag_id']
    @vendor_id = options['vendor_id']
    @amount = options['amount']
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
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM transactions WHERE id = $1"
      values = [id]
      transactions = SqlRunner.run( sql, values )
      result = Transaction.new( transactions.first )
      return result
    end



  end
