class User

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :lockable

  property :firstname, String, :required => true
  property :lastname, String, :required => true


  property :id, Serial

  has n, :open_spaces

  def fullname
    "%s %s" % [self.firstname, self.lastname]
  end


end
