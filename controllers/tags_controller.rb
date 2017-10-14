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

get '/tags/:id/edit' do
  @tags = Tag.find(params['id'])
  erb ( :"tag/edit" )
end

post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  erb( :"tag/create" )
end

post '/tags/:id/delete' do
  @tag = Tag.find(params['id'])
  @tag.delete()
  erb ( :"/tag/delete" )
end

post '/tags/create' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to('/tags')
end
