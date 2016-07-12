class OysterCard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
    @touch = false
    end

  def top_up amount
    fail "Max balance of £#{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct amount
    @balance -= amount
  end

  def in_journey?
    @touch
  end

  def touch_in
    @touch = true
  end

  def touch_out
    @touch = false

  end
end
