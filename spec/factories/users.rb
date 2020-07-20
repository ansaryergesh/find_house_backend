FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      bio { 'Hello world' }
      password { 'password' }
    end
end