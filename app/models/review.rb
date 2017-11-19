class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :content_body, :presence => true, :length => { :minimum => 50, :maximum => 250 }
  validates :rating, :presence => true, :length => { :minimum => 0, :maximum => 5 }
  validates :product_id, :presence => true

  belongs_to :product

  # scope :most_reviews { Review}
end
