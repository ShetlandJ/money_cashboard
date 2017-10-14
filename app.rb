require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/account')
require_relative('./controllers/tags_controller')
require_relative('./controllers/vendor_controller')
require_relative('./controllers/transaction_controller')
require_relative('./controllers/account_controller')

get '/' do
  @accounts = Account.all()
  @transactions_total = Transaction.total()
  @most_common_item = Transaction.most_common_tag()
  @most_spent_on = Transaction.most_spent_on()
  erb ( :home )
end
