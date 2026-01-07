require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /new" do
    context 'when not passed any params' do
      it "redirect to flights/index" do
        get "/bookings/new"
        expect(response).to redirect_to("/flights/index")
      end
    end

    context 'when passed params' do
      it "renders new" do
        flight = create(:flight)
        params = { "booking" => { "flight_id" => flight.id, "no_of_passengers" => 1 } }
        get "/bookings/new", params: params
        expect(response).to render_template(:new)
      end
    end
  end
end
