class Product < ActiveRecord::Base

  has_many :reviews
  belongs_to :category

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader


  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  # validates :quantity, numericality: { greater_than: 0 }
  validates :category, presence: true

end
