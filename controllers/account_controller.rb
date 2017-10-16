require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')
#
# get '/account' do
#     @account = Account.all()
#     erb (:"account/home")
# end

get '/account' do
  @account = Account.all()
  erb ( :"account/home" )
end

post '/account' do
  @account = Account.all().first
  @account.change_income(params['income'].to_i)
  @account.update()
  redirect to('/')
end
