require 'rails_helper'

describe Beehive do
	context 'associations' do
		it "ensure Beehive model has a one to many relationship with Cell model" do
			should have_many(:cells).dependent(:destroy) 
		end
	end

	context 'validations' do
		it "is valid if name is present" do
			should validate_presence_of(:name) 
		end
	end
end
