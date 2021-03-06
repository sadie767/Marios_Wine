require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New'
    fill_in 'Grape', :with => 'Pinot Noir'
    fill_in 'Name', :with => 'Willow'
    fill_in 'Cost', :with => 25
    fill_in 'Country', :with => 'France'
    click_on 'Create Product'
    expect(page).to have_content 'Wines'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
