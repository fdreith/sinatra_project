Household.create(name: "Kirkwood")

User.create(username: "Francesca", password: "password", household_id: 1)
User.create(username: "Mike", password: "password", household_id: 1)
User.create(username: "Annie", password: "password", household_id: 1)
User.create(username: "Todd", password: "password", household_id: 1)

Pet.create(name: "Wyatt", species: "Dog", household_id: 1)
Pet.create(name: "Frankie", species: "Dog", household_id: 1)
Pet.create(name: "Romeo", species: "Dog", household_id: 1)

Event.create(pet_id: 1, event_type: "Feed")
Event.create(pet_id: 2, event_type: "Feed")
Event.create(pet_id: 3, event_type: "Feed")