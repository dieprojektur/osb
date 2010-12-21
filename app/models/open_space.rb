class OpenSpace

  include DataMapper::Resource

  property :id, Serial

  property :title, String
  property :location, String
  property :start, DateTime
  property :end, DateTime
  property :allDay, Boolean

  belongs_to :user
  
  has n, :tracks

  def each_day
    Range.new(self.start, self.end).each { |day|
      yield day
    }
  end

end
