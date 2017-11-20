class Product < ActiveRecord::Base
  validates :grape, :presence => true
  validates :name, :presence => true
  validates :cost, :presence => true,  numericality: true
  validates :country, :presence => true

  has_many :reviews

  scope :three_most_recent, -> { Product.order(created_at: :desc).last(3)}
  scope :usa, -> { Product.where(country: "United States") }
  # scope :most_reviews, -> {
  #   Product.order("reviews_count DESC").limit(1) }
    scope :most_reviews, -> {(select("products.grape, products.id, products.name, products.cost, products.country, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(1))}

end
