class Review < ActiveRecord::Base

  validates :product_id, :user_id, :description, :rating, presence: true

end
