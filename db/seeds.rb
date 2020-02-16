# @francesca = User.create(username: "Francesca", password: "password")
# @mike = User.create(username: "Mike", password: "password")
# @annie = User.create(username: "Annie", password: "password")
# @todd = User.create(username: "Todd", password: "password")


# Household.create(name: "Kirkwood", owner_id: 4)
# Household.create(name: "Tibbetts", owner_id: 1)
Household.create(name: "Test", owner_id: 1)


# Pet.create(name: "Wyatt", species: "Dog", household_id: 1, owner_id: 2)
# Pet.create(name: "Frankie", species: "Dog", household_id: 2, owner_id: 4)
# Pet.create(name: "Romeo", species: "Dog", household_id: 1, owner_id: 4)
# Pet.create(name: "Penelope", species: "Dog", household_id: 2, owner_id: 1)
Pet.create(name: "Test", species: "Dog", household_id: 2, owner_id: 1)


# Event.create(pet_id: 1, event_type: "Feed", details: "2 cups", owner_id: 4, date: Date.today)
# Event.create(pet_id: 2, event_type: "Feed", details: "2 cups", owner_id: 3, date: Date.today)
# Event.create(pet_id: 3, event_type: "Feed", details: "2 cups", owner_id: 2, date: Date.today)
# Event.create(pet_id: 3, event_type: "Feed", details: "2 cups", owner_id: 2, date: Date.today)
Event.create(pet_id: 3, event_type: "Test", details: "2 cups", owner_id: 2, date: Date.today)


# UserHousehold.create(user_id: 1, household_id: 1)
# UserHousehold.create(user_id: 2, household_id: 1)
# UserHousehold.create(user_id: 3, household_id: 1)
# UserHousehold.create(user_id: 4, household_id: 1)
# UserHousehold.create(user_id: 1, household_id: 2)
# UserHousehold.create(user_id: 2, household_id: 2)
UserHousehold.create(user_id: 2, household_id: 2)