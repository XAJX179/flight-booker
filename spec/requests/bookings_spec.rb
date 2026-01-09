require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET bookings/new" do
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

  describe "GET bookings/:booking_id" do
    context 'when passed :booking id' do
      it 'shows the booking' do
        passenger = create(:passenger)
        get "/bookings/#{passenger.booking.id}"
        expect(response).to render_template(:show)
      end
    end
  end

  describe "POST bookings/" do
    context 'when passed params' do
      it 'creates booking' do # rubocop:disable RSpec/ExampleLength
        flight = create(:flight)
        params = { "booking"=>{ "passengers_attributes"=>{ "0"=>{ "name"=>"Hello", "email"=>"Hello.hello.com" },
                                                          "1"=>{ "name"=>"hello2", "email"=>"hello2.gh.com" } },
                  "flight_id"=>flight.id } }
        post "/bookings", params: params
        expect(flight.bookings.count).to eq(1)
      end

      it 'creates passengers' do # rubocop:disable RSpec/ExampleLength
        flight = create(:flight)
        params = { "booking"=>{ "passengers_attributes"=>{ "0"=>{ "name"=>"Hello", "email"=>"Hello.hello.com" },
                                                    "1"=>{ "name"=>"hello2", "email"=>"hello2.gh.com" } },
                  "flight_id"=>flight.id } }
        post "/bookings", params: params
        expect(flight.passengers.count).to eq(2)
      end
    end
  end
end
