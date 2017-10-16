require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')

get '/tags' do
    @tags = Tag.all()
    erb (:"tag/home")
end

get '/tags/new' do
  erb (:"tag/new")
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb ( :"tag/show" )
end

get '/tags/:id/all' do
  @transactions = Tag.all_transactions(params['id'])
  @tag_name = Tag.all()
  erb ( :"tag/all" )
end

get '/tags/:id/edit' do
  @tags = Tag.find(params['id'])
  erb ( :"tag/edit" )
end

post '/tags/create' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to('/tags')
end

post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  erb( :"tag/update" )
end

post '/tags/:id/delete' do
  @tag = Tag.find(params['id'])
  @tag.delete()
  redirect to('/tags')
end
