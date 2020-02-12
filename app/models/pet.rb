class Pet < ActiveRecord::Base
    belongs_to :household
    has_many :events

    #write in methods here to acto fill the event type
end
