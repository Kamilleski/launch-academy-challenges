kamille = User.create(first_name: "Kamille", last_name: "Delgardo", email:
  "freddie_mercury_is_my_spirit_animal@kamille.me")
freddie = User.create(first_name: "Freddie", last_name: "Mercury")
newt = User.create(first_name: "Isaac", last_name: "Newton", email:
  "mint_master@royalmint.uk")
mommy = User.create(first_name: "Agrippina", last_name: "the Younger", email:
  "neros_mom@romanempire.it")

calculus = Project.create(name: "Invent Calculus", description:
  "I don't care what those posers say about Leibniz. We doin' dis shit.")
empire = Project.create(name: "Install global fascist regime")

Assignment.create(user: mommy, project: empire)
Assignment.create(user: kamille, project: empire)
Assignment.create(user: freddie, project: empire)

Assignment.create(user: newt, project: calculus)
Assignment.create(user: kamille, project: calculus)
