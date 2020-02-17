# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- Yes, but I used the Corneal gem
- [x] Use ActiveRecord for storing information in a database 
- [x] Include more than one model class (e.g. User, Post, Category) -- User, Household, UserHousehold (join table), Pet, and Events. 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- I have a many to many relationship with users and households through the joing table user_households. Households have many pets, Pets have many events. 
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- User_household join table belongs to households and users. Events belong to a pet. I also have a few belongs to owner (as users) relationships with households, pets, and events to track who made which changes. 
- [x] Include user accounts with unique login attribute (username or email) -- using validations. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying. There is CRUD capability for all models.
- [x] Ensure that users can't modify content created by other users -- helper method for checking authorization as well as not displaying edit information if they are not the creator.
- [x] Include user input validations -- yes, some inputs use validations and others I made optional for functionality reasons, such as event details beign left optional. I also made it so that a pet could be created without a home so that the pets were not lost from the user's view when a household was deleted. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- yes, success messages and warning messages. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message