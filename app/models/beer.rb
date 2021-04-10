class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, presence: true
    accepts_nested_attributes_for :reviews
end
