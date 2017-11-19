class Product < ActiveRecord::Base
  validates :grape, :presence => true
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true

  has_many :reviews

  scope :three_most_recent, -> { Product.order(created_at: :asc).last(3)}
  scope :usa, -> { Product.where(country: "United States") }
end
