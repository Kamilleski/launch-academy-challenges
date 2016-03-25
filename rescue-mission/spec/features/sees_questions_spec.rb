require 'rails_helper'

# As a user
# I want to view recently posted questions
# So that I can help others
#
# Acceptance Criteria
#
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

feature 'sees questions' do
  scenario 'users sees all questions' do
    user1 = User.create(name: "Kamilleski")
    pregunta = Question.create(title: "the title must be 40 characters or more, so I'm just going to keep typing. Is this 40 characters yet?", description: "150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot. 150 characters is alot.", user_id: user1.id)

    visit questions_path
    expect(page).to have_content(pregunta.title)
  end
end
