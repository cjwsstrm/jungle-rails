class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :password, length: { minimum: 5 }, allow_nil: true
  validates_confirmation_of :password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
    user
    else 
      nil 
    end
  end

  def self.get_id(email)
    User.find_by_email(email).id
  end

end
