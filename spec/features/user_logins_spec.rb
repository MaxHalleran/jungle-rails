require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do

    @user = User.create!(
      first_name: Faker::Hipster.word,
      last_name: Faker::Hipster.word,
      email: "Test@test.com",
      password: 'Password17'
    )

  end

  scenario "the user logins in" do

    visit root_path

    click_on 'Log In'

    within '.user-login' do
      fill_in 'email', with: 'Test@test.com'
      fill_in 'password', with: 'Password17'
      click_button 'Log In'
    end

    save_screenshot

    expect(page.find('.navbar-right')).to have_text 'Test@test.com'

  end

end
