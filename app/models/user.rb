class User < ActiveRecord::Base
    has_secure_password

    validates :username, uniqueness:true
    validates :username, presence:true

    has_many :user_households
    has_many :households, through: :user_households
    has_many :pets, through: :household
    has_one :owned_group, class_name: "Household", foreign_key: "owner_id"
    has_one :owned_group, class_name: "Pet", foreign_key: "owner_id"
    has_one :owned_group, class_name: "Event", foreign_key: "owner_id"


end
