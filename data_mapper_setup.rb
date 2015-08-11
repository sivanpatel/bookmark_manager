require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['postgres://localhost/dcb2oi413s43a4'] || "postgres://localhost/dcb2oi413s43a4")

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!
