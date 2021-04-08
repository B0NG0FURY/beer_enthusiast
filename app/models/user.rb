class User < ApplicationRecord
    has_many :reviews
    has_many :beers, through: :reviews
    has_many :breweries, through: :beers
    validates :username, uniqueness: true, presence: true
    has_secure_password
end
