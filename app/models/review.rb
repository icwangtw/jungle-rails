class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user
  validates :user_id, :product_id, :description, :rating, presence: true

end
