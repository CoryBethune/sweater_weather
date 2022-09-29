class RoadTrip
  attr_reader :time, :lat, :lon
  def self.new_road_trip(data)
    @time = data[:route][:time]
    @lat = data[:route][:boundingBox][:ul][:lat]
    @lon = data[:route][:boundingBox][:ul][:lng]
  end
end
