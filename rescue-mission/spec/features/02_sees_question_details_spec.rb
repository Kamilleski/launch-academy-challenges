require 'rails_helper'

# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

feature 'sees question details' do
  scenario 'users sees a specific question' do
    user1 = User.create(name: "Kamilleski")
    pregunta = Question.create(title: "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?", description: "150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot.", user_id: user1.id)

    visit questions_path
    click_on "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?"

    expect(page).to have_content(pregunta.title)
    expect(page).to have_content("Kamilleski")
    expect(page).to have_content(pregunta.description)
  end
end
