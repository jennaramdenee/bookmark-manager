require 'sinatra/base'

class Manager < Sinatra::Base

  get '/' do
    "My Bookmarks"
  end
end
