require 'rails_helper'

RSpec.describe FlightHelper, type: :helper do
  describe 'has date formatted string' do
    it 'is expected to format date' do
      expect(helper.format_to_date("2026-12-27 18:23:02".to_datetime)).to eq("Sun, 27 Dec 2026")
    end
  end

  describe 'has time formatted string' do
    it 'is expected to format date' do
      expect(helper.format_to_time("2026-12-27 18:23:02".to_time(:utc))).to eq("18:23 UTC(+0000)")
    end
  end
end
