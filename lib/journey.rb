class Journey
  attr_reader :start_station, :end_station

  def in_journey?
    !@journeys.last.include?(:exit_station)
  end

  def start_station(station)
    @start_station << {entry_station: station}
  end

  def end_station(station)
    @end_station.last.store(:exit_station, station)
  end

end
