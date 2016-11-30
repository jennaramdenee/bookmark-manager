require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tag.rb'
require_relative 'models/link.rb'
require_relative 'models/user.rb'

# DataMapper::Logger.new($stdout, :debug)
database = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database)
DataMapper.finalize
DataMapper.auto_upgrade!
