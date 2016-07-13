class OysterCard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1

  def initialize(balance = 0)
    @balance = balance
    # @entry_station = nil
    @journeys = []
  end

  def top_up amount
    fail "Max balance of £#{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    # !!entry_station
    !@journeys.last.include?(:exit_station)
  end

  def touch_in(station)
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    # @entry_station = station
    @journeys << {entry_station: station}
    station
  end

  def touch_out(station)
    deduct MINIMUM_FARE
    # @entry_station = nil
    @journeys.last.store(:exit_station, station)
  end

  private

  def deduct amount
    @balance -= amount
  end
end
