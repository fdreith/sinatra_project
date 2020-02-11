class Household < ActiveRecord::Base
    validates :name, uniqueness:true
    validates :name, presence:true

    has_many :user_households
    has_many :users, through: :user_households
    has_many :pets
    belongs_to :owner, class_name: "User"
end
