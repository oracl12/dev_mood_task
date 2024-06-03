# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicRecord, type: :model do
  describe 'constraints' do
    it { expect(MusicRecord::ALLOWED_CURRENCIES).to match_array(%w[USD EUR UAH]) }
  end

  describe 'associations' do
    it { should have_many(:orders).dependent(:destroy) }
    it { should have_many(:users).through(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(6) }
    it { should validate_length_of(:title).is_at_most(36) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).only_integer }
    it { should validate_presence_of(:currency) }
    it { should validate_inclusion_of(:currency).in_array(MusicRecord::ALLOWED_CURRENCIES) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:damage_assessment).only_integer }
    it { should validate_numericality_of(:damage_assessment).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:damage_assessment).is_less_than_or_equal_to(100) }
  end
end
