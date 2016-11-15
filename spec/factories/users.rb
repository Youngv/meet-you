FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'vg5msvy1' }
    password_confirmation { 'vg5msvy1' }

    factory :invalid_user do
      name nil
    end
  end
end
