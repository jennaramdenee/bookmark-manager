#require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmark")

class Link


include DataMapper::Resource

property :id, Serial
property :name, String
property :location, String

end
