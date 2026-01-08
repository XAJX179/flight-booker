require 'rails_helper'

RSpec.describe "bookings/new.html.erb", type: :view do
  describe 'bookings/new' do
    context 'when passed @flights and @no_of_passengers' do
      it 'shows new form' do
        f = create(:flight)
        assign(:flight, f)
        assign(:no_of_passengers, 1)

        render

        expect(rendered).to match (/Bookings#new/)
      end
    end
  end
end
