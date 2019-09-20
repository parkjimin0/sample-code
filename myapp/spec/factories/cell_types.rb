FactoryGirl.define do
	factory :cell_type do
		name "test"
	end

	trait :empty do
		name 'empty'
	end

	trait :honey do
		name 'honey'
	end

	trait :pollen do
		name 'pollen'
	end

	trait :egg do
		name 'egg'
	end

	trait :larvae do
		name 'larvae'
	end

	trait :pupa do
		name 'pupa'
	end
end
