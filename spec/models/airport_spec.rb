require 'rails_helper'

RSpec.describe Airport, type: :model do
  subject(:airport) { build(:airport) }

  describe 'has code' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'has name' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
  end

  describe 'code is 3 letter' do
    it { is_expected.to validate_length_of(:code).is_equal_to(3) }
  end

  describe 'code is unique' do
    it { is_expected.to validate_uniqueness_of(:code) }
  end

  describe 'name is long' do
    it { is_expected.to validate_length_of(:name).is_at_least(10) }
  end
end
