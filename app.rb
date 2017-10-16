require('sinatra')
require('sinatra/contrib/all')

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
  @grouped_cost = Transaction.grouped_cost()
  erb ( :home )
end
