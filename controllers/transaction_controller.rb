require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')

get '/transactions' do
  @transaction = Transaction.all()
  # @vendors = Vendor.all()
  erb (:"transaction/home")
end

get '/transactions/new' do
  @transaction = Transaction.all()
  @vendors = Vendor.all()
  erb (:"transaction/new")
end

# get '/user/:id' do
#   @student = Student.find(params['id'])
#   erb ( :show )
# end

# get '/user/:id/edit' do
#   @student = Student.find(params['id'])
#   @transaction = Transaction.all()
#   erb ( :edit )
# end

# post '/user/:id' do
#   @student = Student.new(params)
#   @student.update()
#   erb ( :update )
# end

# post '/user/:id/delete' do
#   @student = Student.find(params['id'])
#   @student.delete()
#   erb ( :delete )
# end

# post '/user' do
#   @transaction = Transaction.new(params)
#   @transaction.save()
#   erb( :update )
# end


post '/transactions/created' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :"transaction/create" )
end
