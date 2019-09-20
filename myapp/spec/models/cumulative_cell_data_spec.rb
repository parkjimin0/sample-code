require 'rails_helper'

describe CumulativeCellData do
	let(:subject) { CumulativeCellData.new(@beehive) }

	before(:all) do
		create(:cell_type, :empty)
		create(:cell_type, :honey)
		create(:cell_type, :pollen)
		create(:cell_type, :egg)
		create(:cell_type, :larvae)
		create(:cell_type, :pupa)
		@beehive = create(:beehive)
		cell = create(:cell, :empty_cell)
		@beehive.cells << cell
	end

	describe "#values" do
		context 'when empty cell type data count and percentage is required' do
			it "returns a count value" do
				expect(subject.values["empty"]["count"]).to eq(1)
			end  

			it "returns a percentage value" do
				expect(subject.values["empty"]["percentage"]).to eq(100)
			end 
		end

		context 'when honey cell type data total and percentage is required' do
			it "returns a count value" do
				expect(subject.values["honey"]["count"]).to eq(0)
			end  

			it "returns a percentage value" do
				expect(subject.values["honey"]["percentage"]).to eq(0)
			end 
		end
	end
end
