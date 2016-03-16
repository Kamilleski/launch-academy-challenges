# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

user = User.create(
  provider: "github",
  uid: "1",
  username: "jarlax1",
  email: "jarlax1@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

Meetup.create(name: 'Music for Musical Peoples',
  description: 'All the musics.',
  location: 'Sunny SF',
  created_at: Date.today,
  updated_at: Date.today,
  creator: user)

Meetup.create(name: 'Moon Landings for Cheese Lovers',
  description: 'The moon is made of cheese, right?',
  location: 'The Moon',
  created_at: Date.today,
  updated_at: Date.today,
  creator: user)

Meetup.create(name: 'Apartments for less than $40k / Month',
  description: 'How to find the apartment of your dreams',
  location: 'Sunny SF',
  created_at: Date.today,
  updated_at: Date.today,
  creator: user)
