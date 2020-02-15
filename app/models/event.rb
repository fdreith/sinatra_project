class Event < ActiveRecord::Base
    belongs_to :pet

    validates :event_type, presence:true

end
