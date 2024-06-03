# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Test First Name' }
    last_name { 'Test Last Name' }

    sequence :email do |n|
      "user#{n}@example.com"
    end

    phone_number { '555-444-6789' }
  end
end
