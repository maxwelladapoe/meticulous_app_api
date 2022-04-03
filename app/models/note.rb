class Note < ApplicationRecord
    #relations
    belongs_to :user
    has_many :attachments
end
