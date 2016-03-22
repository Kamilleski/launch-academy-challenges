require 'rails_helper'
# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

feature 'submits an answer' do
  scenario 'user submits a passing answer' do
    user1 = User.create(name: "Kamilleski")
    pregunta = Question.create(title: "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?", description: "150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot.", user_id: user1.id)

    visit questions_path
    click_on "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?"

    click_on "I can answer this!"

    expect(page).to have_content("Answer: ")
    expect(page).to have_selector('form')

    click_on 'Create Answer'
  end
end
