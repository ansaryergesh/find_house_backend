FactoryBot.define do
    factory :user do
      username { 'testuser' }
      bio { 'Biography' }
      password { 'password' }
    end
end