class Household < ActiveRecord::Base
    has_many :user_households
    has_many :users, through: :user_households
    has_many :pets
    belongs_to :owner, class_name: "User"
end
