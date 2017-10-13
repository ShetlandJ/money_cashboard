require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('vendor_controller')
require_relative('transaction_controller')

get '/tag' do
    @tags = Tag.all()
    erb ( :home )
end
