require 'spec_helper'

# As a user
# I want to create a meetup
# So that I can gather a group of people to do an activity
# Acceptance Criteria:
#
# There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
# I must be signed in, and I must supply a name, location, and description.
# If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
# If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.



feature "User creates a meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  scenario "User visits the /meetups/new page" do
    visit "/meetups/new"

    expect(page).to have_content "Create a new meetup"
    expect(page).to have_css("input", count: 4)
  end

  scenario "User submits a new meeting" do
    sign_in_as user

    visit "/meetups/new"

    fill_in "Meetup name:", with: "A meetup!"
    fill_in "Location:", with: "Your house"
    fill_in "Description:", with: "Let's trash the place, bros!"
    click_button "Submit"

    expect(page).to have_content "Here's your meetup!"
    expect(page).to have_content "Meetup details for"
    expect(page).to have_content "A meetup!"
    expect(page).to have_content "Your house"
    expect(page).to have_content "Let's trash the place, bros!"
  end

  scenario "User tries to create event while not signed in" do
    visit "/meetups/new"

    fill_in "Meetup name:", with: "A meetup!"
    fill_in "Location:", with: "Your house"
    fill_in "Description:", with: "Let's trash the place, bros!"
    click_button "Submit"

    expect(page).to have_content "You're not signed in!"
    expect(page).to have_field "Meetup name:", with: "A meetup!"
    expect(page).to have_field "Location:", with: "Your house"
    expect(page).to have_field "Description:", with: "Let's trash the place, bros!"
  end
end
