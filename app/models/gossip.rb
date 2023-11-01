class Gossip < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 14 }
    validates :content, presence: true
    belongs_to :user
    has_many :comments, dependent: :destroy #si gossip est supprimé, les comments seront aussi supprimés avec ça
end