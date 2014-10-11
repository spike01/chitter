env = ENV["RACK_ENV"] || "development"

require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative '../models/user'
require_relative '../models/peep'

DataMapper.finalize
DataMapper.auto_upgrade!
