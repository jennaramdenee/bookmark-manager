<<<<<<< HEAD
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, Text

end
=======
require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

end

# DataMapper::Logger.new($stdout, :debug)
database = "postgres://localhost/bookmark_manager_" +
          (ENV['RACK_ENV'] || "development")
DataMapper.setup(:default, database)
DataMapper.finalize
DataMapper.auto_upgrade!
>>>>>>> d7cff8d6c08aeb934ef91e9ca5031dad48d6c11e
