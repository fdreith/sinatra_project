class User < ActiveRecord::Base
    has_secure_password
    has_many :user_households
    has_many :households, through: :user_households
    has_many :pets, through: :household
    has_one :owned_group, class_name: "Household", foreign_key: "owner_id"
end
