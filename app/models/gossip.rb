class Gossip < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 14 }
    validates :content, presence: true
    belongs_to :user
end