require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/vendor')

get '/vendors' do
  @vendors = Vendor.all()
  erb (:"vendors/home")
end

get '/vendors/new' do
  @tags = Tag.all()
  @vendors = Vendor.all()
  erb (:"vendors/new")
end

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'])
  erb ( :"vendors/show" )
end

get '/vendors/:id/edit' do
  @vendor = Vendor.find(params['id'])
  erb ( :"vendors/edit" )
end

post '/vendors/create' do
  @vendor = Vendor.new(params)
  @vendor.save()
  redirect to('/vendors')
end

post '/vendors/:id' do
  @vendor = Vendor.new(params)
  @vendor.update()
  redirect to('/vendors')
end

post '/vendors/:id/delete' do
  @vendor = Vendor.find(params['id'])
  @vendor.delete()
  redirect to('/vendors')
  # erb ( :"/vendors/delete" )
end
