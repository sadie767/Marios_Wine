require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit products_path
    click_link 'New'
    fill_in 'Grape', :with => 'Pinot Noir'
    fill_in 'Name', :with => 'Willow'
    fill_in 'Cost', :with => 25
    fill_in 'Country', :with => 'France'
    click_on 'Create Product'
    click_on 'Willow'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Bill Murray'
    fill_in 'Content body', :with => '50 charactersssssssssssssssssssssssssssssssssssssssss'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Willow'
  end
end
