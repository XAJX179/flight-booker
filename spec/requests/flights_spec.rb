require 'rails_helper'

RSpec.describe "Flights", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/flights/index"
      expect(response).to have_http_status(:success)
    end

    it "renders search form" do
      get "/flights/index"
      expect(response).to render_template(partial: "_search_form")
    end

    it "renders show when @flights passed" do
      flight = create(:flight)
      params = { "flight" => { "departure_airport"=>flight.departure_airport.id, "arrival_airport"=>flight.arrival_airport.id,
                "no_of_passengers"=>"1", "start_time"=>flight.start_time, "commit"=>"Search" } }
      get "/flights/index", params: params
      expect(response).to render_template(partial: "_show")
    end
  end
end
