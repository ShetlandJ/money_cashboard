require_relative('../db/sql_runner')
require_relative('vendor')
require_relative('transaction')

class Account

  attr_accessor :income
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @income = options['income'].to_i
  end

  def monthly_income()
    monthly_amount = @income / 12
    return monthly_amount.to_i
  end

  def weekly_income()
    @income / 52
  end

  def change_income(value)
    @income = value
  end

  def save()
    sql = "INSERT INTO accounts
    (
      income
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@income]
    user_data = SqlRunner.run(sql, values)
    @id = user_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE accounts
    SET
    (
      income
      ) =
      (
        $1
      )
      WHERE id = $2"
      values = [@income, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM accounts
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all()
      sql = "DELETE FROM accounts"
      values = []
      SqlRunner.run( sql, values )

    end

    def self.all()
      sql = "SELECT * FROM accounts"
      values = []
      accounts = SqlRunner.run( sql, values )
      return accounts.map { |account| Account.new( account ) }
    end

    def self.find( id )
      sql = "SELECT * FROM accounts WHERE id = $1"
      values = [id]
      tag = SqlRunner.run( sql, values )
      result = Tag.new( tag.first )
      return result
    end

  end
