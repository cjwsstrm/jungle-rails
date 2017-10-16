class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :password, length: { minimum: 5 }, allow_nil: true

  validates_uniqueness_of :email, :case_sensitive => false

end
