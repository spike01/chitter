require 'data_mapper'

class Peep 

  include DataMapper::Resource

  has 1, :user, through: Resource

  property :id, Serial
  property :content, Text
  property :timestamp, Time

  #def self.from(params)
    #create(params)
  #end

end
