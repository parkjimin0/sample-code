require "rails_helper"

describe BeehivesController do
	include AuthHelper
	include ResponseBodyParseHelper

	let(:cells) { create_list(:cell, 5, :empty) }
	let(:beehive_id) { @beehives.first.id }

	before(:all) do 
		@beehives = create_list(:beehive, 10)
	end

	describe 'index' do
		it 'returns beehives' do
			get :index, format: :json
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
			get :index, format: :json
			expect(response).to have_http_status(200)
		end

		it 'returns JSON' do
			get :index, format: :json
			expect(response.content_type).to eq('application/json; charset=utf-8')
		end
	end

	describe 'show' do
		before do
			allow_any_instance_of(CumulativeCellData).to receive(:values) {
					nil
			}
		end
		context 'when the beehive id exists' do
			it 'returns beehive' do
				get :show, format: :json, params: { id: 1 }
				@beehives[1].cells = cells
				expect(json).not_to be_empty
				expect(json["id"]).to eq(beehive_id)
			end

			it 'returns status code 200' do
				get :show, format: :json, params: { id: 1 }
				expect(response).to have_http_status(200)
			end

			it 'returns JSON' do
				get :show, format: :json, params: { id: 1 }
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
		end

		context 'when the beehive id does not exist' do
			it 'returns status code 404' do
				get :show, format: :json, params: { id: 100 }
				expect(response).to have_http_status(404)
			end
		end
	end

	describe 'new' do
		before do
			http_login_beehive
		end

		it 'returns status code 200' do
			get :new, format: :json
			expect(response).to have_http_status(200)
		end

		it 'returns JSON' do
			get :new, format: :json
			expect(response.content_type).to eq('application/json; charset=utf-8')
		end
	end

	describe 'create' do
		before do
			http_login_beehive
		end

		context 'when beehive has been created' do
			it 'creates a beehive' do
				post :create, format: :json, params: { beehive: { name: "sample hive" } }
				expect(json["name"]).to eq("sample hive")
			end

			it 'returns JSON' do
				post :create, format: :json, params: { beehive: { name: "sample hive" } }
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
		end

		context 'when beehive has not been created due to empty values' do
			it 'creates a beehive' do
				post :create, format: :json, params: { beehive: { name: "" } }
				expect(json["name"]).to eq(["can't be blank"])
			end
		end
	end

	describe 'update' do
		before do
			http_login_beehive
		end

		context 'when beehive has updated' do
			it 'creates a beehive' do
				put :update, format: :json, params: { id: 1, beehive: { name: "new sample hive" } }
				expect(json["name"]).to eq("new sample hive")
			end

			it 'returns JSON' do
				put :update, format: :json, params: { id: 1, beehive: { name: "new sample hive" } }
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
		end

		context 'when beehive has not been updated due due to empty values' do
			it 'creates a beehive' do
				put :update, format: :json, params: { id: 1, beehive: { name: "" } }
				expect(json["name"]).to eq(["can't be blank"])
			end
		end
	end

	describe 'destroy' do
		before do
			http_login_beehive
		end
		
		it 'destroys a beehive' do
			delete :destroy, format: :json, params: { id: 1 }
			expect(Beehive.exists?(:id => [1])).to eq(false)
		end
	end
end
