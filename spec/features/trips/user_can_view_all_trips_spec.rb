require_relative '../../spec_helper'


describe "trips" do
  describe "when a user visits '/trips'" do
    it "the user should see the first thirty trips" do
      count = 0
      id = 0
      duration = 100
      day = 0
      35.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})

      end
      visit("/trips")

      expect(Trip.all.count).to eq (35)
      expect(page).to have_content ("Number of Trips")
      find("th",text: 'Number of Trips').should have_no_content(31)
      expect(page).to have_content ("30")
    end

    it "the user should see the first thirty trips organized by date" do
      count = 0
      id = 0
      duration = 100
      day = 0
      35.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})
      end
      visit("/trips")

      expect(page).to_not have_content("Trip Id: 31")
      expect(Trip.first.start_date).to eq("8/1/2013")
      thirtieth_trip = Trip.find(30)
      expect(thirtieth_trip.start_date).to eq("8/59/2013")
    end

    it "if the user clicks on button 2, the user should see the second page of trips" do
      count = 0
      duration = 100
      id = 0
      day = 0
      60.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})

      end
      visit("/trips")
      click_link_or_button("2")
      # expect(page).to have_content("Trip Id: 40")
      expect(Trip.first.start_date).to eq("8/1/2013")
      thirtieth_trip = Trip.find(30)
      expect(thirtieth_trip.start_date).to eq("8/59/2013")
    end

    it "the user should also be able to delete a trip" do
      Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")
      
      visit("/trips")
      fill_in("insert_id",with: 4069)
      click_on("delete_trip")
    end
  end
end
