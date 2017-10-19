require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')

get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transaction/home")
end


get '/transactions/:id/edit' do
  @transactions = Transaction.find(params['id'])
  @vendors = Vendor.all()
  @tags = Tag.all()
  @tag_types = Tag.all_types()
  erb ( :"transaction/edit" )
end

get '/transactions/:year/:month' do
  @transactions = Transaction.by_date(params[:year], params[:month])
  @all_transactions = Transaction.all()
  @month = params[:month]
  erb (:"transaction/by_date")
end

get '/transactions/new' do
  @vendors = Vendor.all()
  @tags = Tag.all()
  @tag_types = Tag.all_types()
  erb (:"transaction/new")
end

get '/transactions/:id' do
  @transactions = Transaction.find(params['id'])
  erb ( :"transaction/show" )
end

post '/transactions/create' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to("/transactions")
end

post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect to('/transactions')
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete()
  redirect to('/transactions')
end
