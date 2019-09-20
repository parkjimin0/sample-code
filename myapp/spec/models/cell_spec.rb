require 'rails_helper'

describe Cell do
	context 'associations' do
		it "ensure Cell model has a one to many relationship with Beehive model" do
			should belong_to(:beehive) 
		end

		it "ensure Cell model has a one to many relationship with CellType model" do
			should belong_to(:cell_type) 
		end
	end

	context 'validations' do
		it "is valid if name is present" do
			should validate_presence_of(:name) 
		end
	end
end
