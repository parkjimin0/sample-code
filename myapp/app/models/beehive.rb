class Beehive < ApplicationRecord
    validates :name, :presence => true

    has_many :comments
end
