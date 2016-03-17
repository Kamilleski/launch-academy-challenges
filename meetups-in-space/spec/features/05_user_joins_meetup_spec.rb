require 'spec_helper'

# As a user
# I want to join a meetup
# So that I can partake in this meetup
# Acceptance Criteria:
#
# On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
# If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
# If I am not signed in and I click the button, I should see a message which says that I must sign in.

feature "User joins meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:meetup_1) do
    Meetup.create(name: 'Music for Musical Peoples',
      description: 'All the musics.',
      location: 'Sunny SF',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end


  scenario "Authenticated user sees a button for joining a meetup" do
    meetup_1
    visit "/meetups"

    click_link "Music for Musical Peoples"

    expect(page).to have_button "Join Meetup"
  end

  xscenario "Unauthenticated user sees a button for joining a meetup" do

  end
end
