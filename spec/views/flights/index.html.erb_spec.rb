require 'rails_helper'

RSpec.describe "flights/index.html.erb", type: :view do
  describe 'flights/index' do
    context 'when passed @flights' do
      it 'shows flights' do
        assign(:flights, create_list(:flight, 2))

        render

        expect(rendered).to match (/To ==>/)
      end
    end

    it 'shows form' do
      render

      expect(rendered).to match (/search/)
    end
  end
end
