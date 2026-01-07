require 'rails_helper'

RSpec.describe "bookings/new.html.erb", type: :view do
  describe 'bookings/new' do
    context 'when passed params: flight_id and no_of_passengers' do
      it 'shows new form' do
        f = create(:flight)
        assign(:flight_id, f.id)
        assign(:no_of_passengers, 1)

        render

        expect(rendered).to match (/Bookings#new/)
      end
    end
  end
end
