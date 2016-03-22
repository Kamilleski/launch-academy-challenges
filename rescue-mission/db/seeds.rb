# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kamille = User.create(name: "Kamilleski")
joe = User.create(name: "JoGo")
stefano = User.create(name: "HuLikesMusic")
jarvis = User.create(name: "Jarlax")
meg = User.create(name: "FloppyEars")

babies = Question.create(title: "My mom and dad won't tell me, so I'm asking the internet like any responsible teenager: where do babies come from??!?", description: "I hear a lot of stuff on the playground, but I'm not sure of the veracity of anyone's claims. Plus I'm not buying that whole 'stork' bullshit. I'm not a baby myself, so I've grown out of lies. Wouldn't the world be a better place if everyone were just honest to children about these kinds of things? Same goes for Santa Claus.", user_id: 4)
