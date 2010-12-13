class OpenSpace

  include DataMapper::Resource

  property :id, Serial

  property :title, String
  property :location, String
  property :start, DateTime
  property :end, DateTime
  property :allDay, Boolean

  belongs_to :user

end
