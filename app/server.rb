require 'sinatra/base'
require './data_mapper_setup'

class Bookmark_Manager < Sinatra::Base
  set :views, proc { File.join(root,'..','views') }
  get '/' do
    'Hello Bookmark_Manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
