# frozen_string_literal: true

FactoryBot.define do
  factory :music_record do
    title { 'Test Record' }
    photo { 'https://example.com/image.jpg' }
    price { 100 }
    currency { 'USD' }
    description { 'Test Description' }
    damage_assessment { 50 }
  end
end
