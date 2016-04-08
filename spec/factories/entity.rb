FactoryGirl.define do
  factory :entity, :class => 'Entity' do
  	trait :modules_category_id do      
    	modules_category_id
    end    
    name { Faker::Name.name }
    slug  Faker::Name.name 
    controller Faker::Name.name 
    is_dev false
  end
end