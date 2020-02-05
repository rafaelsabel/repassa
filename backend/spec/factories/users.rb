# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[evaluator evaluated] do
    name { 'User' }
    sequence(:email) { |n| "user#{n}@email.com" }
    password { 'password' }
    confirmed_at { DateTime.now }

    trait :administrator do
      role { 'administrator' }
    end

    trait :employee do
      role { 'employee' }
    end
  end
end
