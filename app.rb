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
  erb ( :home )
end
