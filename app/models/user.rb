class User < ApplicationRecord
    has_many :reviews
    has_many :beers, through: :reviews
    has_many :breweries, through: :beers
    validates :username, uniqueness: true, presence: true, length: { in: 3..30 }
    has_secure_password
    validates :password, length: { in: 3..30 }

    def personal_top_ten
        self.reviews.sort_by {|review| review.rating}.reverse[0..9]
    end
end
