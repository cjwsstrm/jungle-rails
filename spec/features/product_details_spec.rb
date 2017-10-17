require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
     @product = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the product details on a product's page" do

    visit root_path
    
    first('article.product').find_link("#{@product.name}").click
      
    sleep 2
   
    save_screenshot
  end


end