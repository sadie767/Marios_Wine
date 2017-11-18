class Product < ActiveRecord::Base
  validates :grape, :presence => true
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true

  has_many :reviews
end
