class RoadTrip
  attr_reader :time, :lat, :lon

  def initialize(data)
    @time = Time.at(data[:route][:time]).utc.strftime("%H:%M:%S")
    @lat = data[:route][:boundingBox][:ul][:lat]
    @lon = data[:route][:boundingBox][:ul][:lng]
  end
end
