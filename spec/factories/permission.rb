FactoryGirl.define do
  factory :permission, :class => 'Permission' do
  	trait :entity_id do          	
  		entity_id
    end    
    action_name { Faker::Name.name }
    action Faker::Name.name
  end
end