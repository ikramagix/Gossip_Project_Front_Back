class User < ApplicationRecord
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "You need an email address to proceed. It's mandatory." }
    belongs_to :city
    has_many :gossips
end