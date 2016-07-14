class Journey
  attr_reader :start_station, :end_station

  def in_journey?
    @end_station.nil?
  end

  def start_station(station)
    @start_station = station
  end

  def end_station(station)
    @end_station = station
  end

end
