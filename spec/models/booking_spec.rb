require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking) { build(:booking) }

  describe 'has verified bool' do
    it { is_expected.to have_db_column(:verified).of_type(:boolean) }
  end

  describe 'belongs to flight' do
    it { is_expected.to belong_to(:flight) }
  end

  describe 'has many passengers' do
    it { is_expected.to have_many(:passengers) }
  end
end
