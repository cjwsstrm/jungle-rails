class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :password, length: { minimum: 5 }, allow_nil: true

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true

end
