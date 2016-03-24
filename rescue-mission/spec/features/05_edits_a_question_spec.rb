require 'rails_helper'
# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page
feature 'edits an answer' do
  scenario 'user edits a passing answer' do
    user1 = User.create(name: "Kamilleski")
    pregunta = Question.create(title: "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?", description: "150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot.", user_id: user1.id)

    visit questions_path
    click_on "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?"
