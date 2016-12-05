require_relative '../spec_helper'

describe "Station" do
  describe "validates" do
    it "presence of name" do
      invalid_station = Station.new(dock_count: 1, city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of dock count" do
      invalid_station = Station.new(name: "Station 1", city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of city" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of installation date" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, city: "Denver")

      expect(invalid_station).to_not be_valid
    end
  end
end