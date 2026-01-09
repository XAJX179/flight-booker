require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject(:passenger) { build(:passenger) }

  describe 'belongs to booking' do
    it { is_expected.to belong_to(:booking) }
  end

  describe 'has many flights through booking' do
    it { is_expected.to have_many(:flights).through(:booking) }
  end
end
