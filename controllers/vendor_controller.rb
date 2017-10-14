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

post '/vendors/create' do
  @existing = Vendor.all()
  @vendor = Vendor.new(params)
  if @existing.include? @vendor
    redirect to('/vendors')
  else
  @vendor.save()
  redirect to('/vendors')
end
end
