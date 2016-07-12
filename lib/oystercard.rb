class OysterCard
  attr_reader :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up amount
    fail "Max balance of £#{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct MINIMUM_FARE
    @in_journey = false
  end

private

def deduct amount
  @balance -= amount
end

end
