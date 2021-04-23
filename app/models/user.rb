class User < ApplicationRecord
    has_many :reviews
    has_many :beers, through: :reviews
    has_many :breweries, through: :beers
    validates :username, uniqueness: true, presence: true, length: { in: 3..15 }
    has_secure_password
    validates :password, length: { in: 4..20 }
end
