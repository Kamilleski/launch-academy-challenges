require 'spec_helper'

# As a user
# I want to see who has already joined a meetup
# So that I can see if any of my friends have joined
# Acceptance Criteria:
#
# On a meetup's show page, I should see a list of the members that have joined the meetup.
# I should see each member's avatar and username.

feature "User can access a meetup detail page" do
  let(:user1) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:user2) do
    User.create(
      provider: "github",
      uid: "2",
      username: "kamilleski",
      email: "kdelgardo@berkeley.edu",
      avatar_url: "https://avatars0.githubusercontent.com/u/9746985?v=3&s=400"
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

  let(:meetup_2) do
    Meetup.create(name: 'Moon Landings for Cheese Lovers',
      description: 'The moon is made of cheese, right?',
      location: 'The Moon',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end

  let(:meetup_3) do
    Meetup.create(name: 'Apartments for less than $40k / Month',
      description: 'How to find the apartment of your dreams',
      location: 'Sunny SF',
      created_at: Date.today,
      updated_at: Date.today,
      creator: user)
  end

  scenario "User loads '/meetups' page and clicks link to details" do
    meetup_1
    meetup_2
    meetup_3
    user1
    user2

    visit '/meetups'
    click_link 'Music for Musical Peoples'

    expect(page).to have_content 'Music for Musical Peoples'
    expect(page).to have_content 'All the musics.'
    expect(page).to have_content 'Sunny SF'
    expect(page).to_not have_content 'The Moon'
    expect(page).to_not have_content "Here's your meetup!"
  end

  xscenario "Meetup details page has info on creator" do
  end
end
