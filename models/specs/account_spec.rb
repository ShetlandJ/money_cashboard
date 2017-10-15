require('minitest/autorun')
require('minitest/rg')

require_relative('../account')

class TestAccount < MiniTest::Test
  def setup()
    @account = Account.new({ "income" => 28000 })
  end

  def test_monthly_income()
    assert_equal(2333, @account.monthly_income)
  end

  def test_weekly_income()
    assert_equal(538, @account.weekly_income)
  end

end
