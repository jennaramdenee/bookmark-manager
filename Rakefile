require 'data_mapper'
require 'dm-postgres-adapter'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
  end

end
