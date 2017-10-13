class Review < ActiveRecord::Base

  belongs_to :product

  validates :description, :rating, presence: true

end



