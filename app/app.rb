ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Manager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :sign_up
  end

  post '/links' do
    user = User.create(email: params[:email],
        password: params[:password])
    p user.email
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @link = Link.all
    @user = current_user
    erb :links
  end

  get '/links/new' do
    erb(:new)
  end

  post '/links' do
    link = Link.new(title: params[:title],
                    url: params[:url] )
    params[:tags].split(', ').each{ |name|
      link.tags << Tag.first_or_create(name: name)
    }
    link.save
    @link = Link.all
    erb(:links)
  end

  get '/tags/:name' do
    @tag = Tag.first(name: params[:name])
    @links = @tag ? @tag.links : []
    erb(:tags)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
