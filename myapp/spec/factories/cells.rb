FactoryGirl.define do
	factory :cell do
		name "Test Cell"
		association :beehive
	end

	trait :empty_cell do
		name "Empty room cell"
		cell_type_id 1
		beehive_id 1
	end

	trait :pollen_cell do
		name "Pollen room cell"
		cell_type_id 3
		beehive_id 1
	end
end
