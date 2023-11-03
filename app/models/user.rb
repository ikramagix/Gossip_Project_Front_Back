class User < ApplicationRecord
    has_secure_password
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "You need an email address to proceed. It's mandatory." }
    belongs_to :city
    has_many :gossips, dependent: :destroy 
    has_many :comments, dependent: :destroy
    #si l'utilisateur est supprimé, ses gossips et comments disparaitront avec lui grace à dependent: :destroy

    def remember(remember_token)
        remember_digest = BCrypt::Password.create(remember_token)
        self.update(remember_digest: remember_digest)
    end
end