# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:music_record) }
  end

  describe 'validations' do
    it { should validate_presence_of(:initial_price) }
    it { should validate_numericality_of(:initial_price).only_integer }

    it { should validate_numericality_of(:initial_damage_assessment).only_integer }
    it { should validate_numericality_of(:initial_damage_assessment).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:initial_damage_assessment).is_less_than_or_equal_to(100) }

    it { should validate_length_of(:note).is_at_most(128) }
    it { should allow_value('').for(:note) }
  end
end
