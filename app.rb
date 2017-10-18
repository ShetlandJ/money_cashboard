require('sinatra')
require('sinatra/contrib/all')
require('date')

require_relative('./models/account')
require_relative('./controllers/tags_controller')
require_relative('./controllers/vendor_controller')
require_relative('./controllers/transaction_controller')
require_relative('./controllers/account_controller')

get '/' do
  @accounts = Account.all()
  @transactions = Transaction.all()
  @transactions_total = Transaction.total()
  @most_common_item = Transaction.most_common_tag()
  @most_spent_on = Transaction.most_spent_on()
  @most_common_tag_by_number = Transaction.most_common_tag_by_number()
  @most_common_tag_by_number_by_month = Transaction.most_common_tag_by_number_by_month( Date.today.month )
  @grouped_cost = Transaction.grouped_cost()
  @month = Transaction.by_date(params[:year], params[:month])
  @total_by_month = Transaction.total_by_month(10)
  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  # @most_common_tag_per_month = Transaction.most_common_tag_per_month( Date.today.month )
  @most_common_tag_per_month = Transaction. most_common_tag_per_month( Date.today.month )
  erb ( :home )
end
