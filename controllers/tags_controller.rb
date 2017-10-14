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

post '/tags/create' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to('/tags')
end
