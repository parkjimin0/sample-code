require "rails_helper"

describe CellsController do
	include AuthHelper
	include ResponseBodyParseHelper
    
    before(:all) do 
        @cells = create_list(:cell, 5, :empty)
        @beehives = create_list(:beehive, 10)
        @cell_types = create_list(:cell_type, 2)
	end
    let(:cell_id) { @cells.first.id }

    describe 'cells' do
		it 'returns all cells' do
			get :cells
			expect(json).not_to be_empty
			expect(json.size).to eq(5)
		end

		it 'returns status code 200' do
			get :cells
			expect(response).to have_http_status(200)
		end

		it 'returns JSON' do
			get :cells
			expect(response.content_type).to eq('application/json; charset=utf-8')
		end
	end

    describe 'cell' do
		it 'returns 1 cell' do
            get :cell, params: { id: 1 }
            expect(json["name"]).to eq("empty")
            expect(json["beehive"]["name"]).to eq("Test Hive")
		end

		it 'returns status code 200' do
			get :cell, params: { id: 1 }
			expect(response).to have_http_status(200)
		end

		it 'returns JSON' do
			get :cell, params: { id: 1 }
			expect(response.content_type).to eq('application/json; charset=utf-8')
		end
    end

	describe 'create' do
		before do
			http_login
		end
        it 'creates a cell' do
            post :create, format: :json, params: { beehive_id: 1, cell: { name: "sample cell"} }
            expect(json["name"]).to eq("sample cell")
            expect(json["beehive_id"]).to eq(1)
        end

        it 'returns JSON' do
            post :create, format: :json, params: { beehive_id: 1, cell: { name: "sample cell"} }
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
	end

	describe 'update' do
		before do
			http_login
		end

		context 'when beehive has updated' do
			it 'updates a cell' do
				put :update, format: :json, params: { id: 1, beehive_id: 1, cell: { name: "new sample hive" } }
				expect(json["name"]).to eq("new sample hive")
			end

			it 'returns JSON' do
				put :update, format: :json, params: { id: 1, beehive_id: 1, cell: { name: "new sample hive" } }
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
		end
	end

	describe 'destroy' do
		before do
			http_login
		end
		
		it 'destroys a beehive' do
			delete :destroy, format: :json, params: { beehive_id: 1, id: 1 }
			expect(Cell.exists?(:id => [1])).to eq(false)
		end
	end
end