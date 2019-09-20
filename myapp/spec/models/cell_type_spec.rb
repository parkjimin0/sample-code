require 'rails_helper'

describe CellType do
    context 'associations' do
        it "ensure CellType model has a one to many relationship with Cell model" do
            should have_many(:cells) 
        end
    end
end