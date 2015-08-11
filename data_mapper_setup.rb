require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.setup(:default, dbtype://remcqumtcdfptv:Fq5ILIJBUgn7EwUAHQkZkHzHDi@ec2-54-197-230-210.compute-1.amazonaws.com:5432/dcb2oi413s43a4) 
require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!
