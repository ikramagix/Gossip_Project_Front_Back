class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :gossip
    validates :content, presence: true, length: { minimum: 3 }
end