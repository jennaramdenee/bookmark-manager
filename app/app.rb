ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'pry'

class BookmarkManager < Sinatra::Base

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



  # start the server if ruby file executed directly
  run! if app_file == $0
end
