# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe 'enums' do
    it { should define_enum_for(:role).with_values(user: 0, manager: 1, admin: 2) }
  end

  describe 'associations' do
    it { should have_many(:orders).dependent(:destroy) }
    it { should have_many(:music_records).through(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(4).is_at_most(36) }

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(4).is_at_most(36) }

    it { should validate_presence_of(:email) }

    describe 'Uniqueness validation' do
      subject { create(:user) }

      it { should validate_uniqueness_of(:email) }
    end

    it { should allow_value('example@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }

    it { should allow_value('123-456-7890').for(:phone_number) }
    it { should allow_value('(123) 456-7890').for(:phone_number) }
    it { should_not allow_value('invalid_phone_number').for(:phone_number) }
  end

  describe '#order' do
    let(:music_record) { create(:music_record) }
    let(:user) { create(:user) }

    it 'creates an order for the given music record' do
      expect { user.order(music_record) }.to change { Order.count }.by(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
