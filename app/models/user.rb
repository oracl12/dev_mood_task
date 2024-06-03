# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user manager admin]

  has_many :orders, dependent: :destroy
  has_many :music_records, through: :orders

  validates :first_name, presence: true, length: { minimum: 4, maximum: 36 }
  validates :last_name, presence: true, length: { minimum: 4, maximum: 36 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, format: {
    with: /\A(\+\d{1,2}\s?)?1?-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  }, allow_blank: true

  def order(music_record)
    orders.create(
      music_record:,
      initial_price: music_record.price,
      initial_damage_assessment: music_record.damage_assessment
    )
  end
end
