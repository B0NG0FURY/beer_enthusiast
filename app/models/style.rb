class Style < ApplicationRecord
    has_many :beers
    validates :name, uniqueness: true
end
