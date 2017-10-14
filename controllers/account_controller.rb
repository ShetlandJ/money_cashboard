require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')
#
# get '/tags' do
#     @tags = Tag.all()
#     erb (:"tag/home")
# end
#
# get '/tags/new' do
#   erb (:"tag/new")
# end
#
# post '/tags' do
#   @tag = Tag.new(params)
#   vendor.save()
#   redirect to('/tags')
# end
