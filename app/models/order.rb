# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :music_record

  validates :initial_price, presence: true, numericality: { only_integer: true }
  validates :initial_damage_assessment, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  }
  validates :note, length: { maximum: 128 }, allow_blank: true
end
