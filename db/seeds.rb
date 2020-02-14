Household.create(name: "Kirkwood", owner_id: 4)

User.create(username: "Francesca", password: "password")
User.create(username: "Mike", password: "password")
User.create(username: "Annie", password: "password")
User.create(username: "Todd", password: "password")

Pet.create(name: "Wyatt", species: "Dog", household_id: 1)
Pet.create(name: "Frankie", species: "Dog", household_id: 1)
Pet.create(name: "Romeo", species: "Dog", household_id: 1)

Event.create(pet_id: 1, event_type: "Feed")
Event.create(pet_id: 2, event_type: "Feed")
Event.create(pet_id: 3, event_type: "Feed")

UserHousehold.create(user_id: 1, household_id: 1)
UserHousehold.create(user_id: 2, household_id: 1)
UserHousehold.create(user_id: 3, household_id: 1)
UserHousehold.create(user_id: 4, household_id: 1)