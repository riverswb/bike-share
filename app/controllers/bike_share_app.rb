class BikeShareApp < Sinatra::Base

  get '/trips' do
    trips = Trip.all.order(:start_date)
    trips = trips.each_slice(30)
    count = 0
    trips_hash = create_trip_hash(trips,count)
    @trips = find_correct_trip_grouping(trips_hash,params["page"])
    erb :'trips/index'
  end

  def create_trip_hash(trips,count)
    trips.group_by do |trip|
      trip[count]
      count += 1
    end
  end

  def find_correct_trip_grouping(trips_hash,search_value)
    trips_hash[search_value.to_i].flatten
  end

  get '/trips/:id' do
    @trips = Trip.find(id)

    erb :'trips/show'
  end

end
