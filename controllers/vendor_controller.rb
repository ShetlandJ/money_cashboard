require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')

get '/vendors' do
    @vendors = Vendor.all()
    erb (:"vendors/home")
end

get '/vendors/new' do
  erb (:"vendors/new")
end

post '/vendors' do
  @vendor = Vendor.new(params)
  vendor.save()
  redirect to('/vendors')
end
