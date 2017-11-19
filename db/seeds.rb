Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(grape: "Pinot Gris",
    name: Faker::Witcher.character,
    cost: Faker::Number.between(10, 500),
    country: Faker::Witcher.location)
  p "Created #{Product.count} products"
    5.times do |index|
   Review.create!(author: Faker::TwinPeaks.character,
     content_body: Faker::Lorem.sentence(20, false, 0).chop,
     rating: Faker::Number.between(1, 5),
     product_id: product.id)
   end
   p "Created #{Review.count} reviews"
end
p "Created #{Product.count} products"
