require 'rails_helper'

# As a user
# I want to post a question
# So that I can receive help from others
#
# Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

feature 'submits a question' do
  scenario 'users submits a passing question' do

    visit new_question_path
    fill_in 'Title', with: 'One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen'
    fill_in 'User', with: '1'
    fill_in 'Description', with: "Capybara.exact and the exact option work together with the is expression inside the XPath gem. When exact is true, all is expressions match exactly, when it is false, they allow substring matches. Many of the selectors built into Capybara use the is expression. This way you can specify whether you want to allow substring matches or not. Capybara.exact is false by default. I must be presented with errors if I fill out the form incorrectly"

    click_on "Create Question"

    expect(page).to have_content("Four Five Six")
    expect(page).to have_content("Capybara.exact")
  end

  scenario 'user submits invalid question' do
    visit new_question_path
    user2 = User.create(name: "JoGo")


    fill_in 'Title', with: 'Not enough characters'
    fill_in 'User', with: '1'
    fill_in 'Description', with: "Way too few characters!"

    click_on "Create Question"

    expect(page).to have_content("Invalid form submission")
  end
end
