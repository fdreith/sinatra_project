class UserHousehold < ActiveRecord::Base
    belongs_to :user
    belongs_to :household
end
