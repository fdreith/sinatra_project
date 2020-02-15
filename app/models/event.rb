class Event < ActiveRecord::Base
    belongs_to :pet
    belongs_to :owner, class_name: "User"

    validates :event_type, presence:true

end
