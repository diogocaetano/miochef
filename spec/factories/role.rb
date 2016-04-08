FactoryGirl.define do
  factory :role, :class => 'Role' do
    name { Faker::Name.name }
  end
end