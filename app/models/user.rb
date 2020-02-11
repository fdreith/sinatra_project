class User < ActiveRecord::Base
    has_and_belongs_to_many :households
    has_many :pets, through households
end
