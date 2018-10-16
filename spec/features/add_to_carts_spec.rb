require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    visit root_path

    click_on 'Sign Up'

    within '.new_user' do
      fill_in 'user[email]', with: 'fluffers@gmail.com'
      fill_in 'user[password]', with: 'Password17'
      fill_in 'user[password_confirmation]', with: 'Password17'
      fill_in 'user[first_name]', with: 'Fluffy'
      fill_in 'user[last_name]', with: 'Bunny'
      click_button 'Sign Up'
    end

  end

  scenario "the user adds an item to their cart" do

    visit root_path

    page.first('article.product footer button').click

    save_and_open_screenshot

    expect(page.find('.navbar-right')).to have_text 'My Cart (1)'
  end
end
