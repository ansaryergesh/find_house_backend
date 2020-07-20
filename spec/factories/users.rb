# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'testuser' }
    bio { 'Biography' }
    password { 'password' }
  end
end
