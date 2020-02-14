class Pet < ActiveRecord::Base
    validates :name, uniqueness:true
    validates :name, presence:true
    validates :household_id, presence:true

    belongs_to :household
    has_many :events

    #write in methods here to acto fill the event type
end
