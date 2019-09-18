class Cell < ApplicationRecord
  belongs_to :beehive

  validates :name, :presence => true
end
