class Track

  include DataMapper::Resource

  property :id, Serial

  property :name, String
  property :location, String
  property :position, Integer
  
  belongs_to :open_space

end
