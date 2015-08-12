require 'sinatra/base'
require './data_mapper_setup'



class Bookmark_Manager < Sinatra::Base

  set :views, proc { File.join(root,'..','views') }
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Bookmark_Manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    tags = params[:tag].split(/\s/).map { |tag| Tag.first_or_create(name: tag) }
    link = Link.new(url: params[:url], title: params[:title], tags: tags)
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
              password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
