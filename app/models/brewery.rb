class Brewery < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    has_many :beers
end
