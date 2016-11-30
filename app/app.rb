ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Manager < Sinatra::Base

  get '/links' do
    @link = Link.all
    erb :links
  end

  get '/links/new' do
    erb(:new)
  end

  post '/links' do
    link = Link.new(title: params[:title],
                    url: params[:url] )
    params[:tags].split(', ').each{ |name|
      link.tags << Tag.create(name: name)
    }
    link.save
    @link = Link.all
    erb(:links)

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
