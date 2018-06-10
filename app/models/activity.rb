class Activity < ApplicationRecord
    validates_presence_of :name, :activity_id
end
