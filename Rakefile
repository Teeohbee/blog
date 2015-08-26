require 'data_mapper'
require './data_mapper_setup'

task :auto_upgrade do
 DataMapper.auto_upgrade!
 puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
 DataMapper.auto_migrate!
 puts 'Auto-migrate complete (data could have been lost)'
end

# => To run either of these, run the following from the command line
# in the project directory:
# $ rake auto_upgrade
# $ rake auto_migrate