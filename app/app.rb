ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'pry'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.create(url: params[:URL], title: params[:title])

    params[:tag_name].split(',').each do |name|
      tag = Tag.first_or_create(tag_name: name.strip)
      link.tags << tag
    end

    link.save
    redirect '/links'
  end

  get '/tags/:tag_name' do
    tag = Tag.first(tag_name: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new_user'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new_user'
    end
  end

  get '/session/new' do
      @user = User.new
      erb :'session/new'
  end

  post '/session' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'session/new'
    end
  end







  # start the server if ruby file executed directly
  run! if app_file == $0
end
