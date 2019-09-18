class Beehive < ApplicationRecord
    has_many :cells, :dependent => :destroy
    validates :name, :presence => true
end
