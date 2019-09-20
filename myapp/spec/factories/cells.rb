FactoryGirl.define do
	factory :cell do
		name "Test Cell"
		association :beehive
	end

	trait :empty_cell do
		name "Empty room cell"
		cell_type_id 1
	end
end
