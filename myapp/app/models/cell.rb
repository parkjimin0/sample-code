class Cell < ApplicationRecord
  belongs_to :beehive
  belongs_to :cell_type, optional: true
  validates :name, :presence => true
end
