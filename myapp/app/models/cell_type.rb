class CellType < ApplicationRecord
    has_many :cells
    attr_accessor :cells
end
