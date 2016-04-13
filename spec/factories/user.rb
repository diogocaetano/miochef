FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    trait :role_id do
      role_id 1  
    end    
    email
    is_dev true
    name "Diogo"
    password '12345678'
    password_confirmation '12345678'
  end
end