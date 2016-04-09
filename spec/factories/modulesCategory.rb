FactoryGirl.define do
  factory :modulesCategory, :class => 'ModulesCategory' do
     name { Faker::Name.name }
     icon { Faker::Name.name }
  end
end