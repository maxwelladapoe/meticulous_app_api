class Attachment < ApplicationRecord
    #relations
    belongs_to :user
    belongs_to :note
end
