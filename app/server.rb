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

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tag].split(/\s/)
    tags.each do |tag|
      tag_param = Tag.create(name: tag)
      link.tags << tag_param
    end
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
      tag = (Tag.first(name: params[:name]))
      @links = tag ? tag.links : []
    erb :'links/index'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
