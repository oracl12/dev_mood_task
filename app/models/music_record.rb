# frozen_string_literal: true

class MusicRecord < ApplicationRecord
  ALLOWED_CURRENCIES = %w[USD EUR UAH].freeze

  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  validates :title, presence: true, length: { minimum: 6, maximum: 36 }
  validates :photo, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :currency, presence: true, inclusion: { in: ALLOWED_CURRENCIES }
  validates :description, presence: true
  # damage_assessment is percentage
  validates :damage_assessment, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  }
end
