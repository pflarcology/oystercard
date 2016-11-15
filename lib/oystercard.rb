class Oystercard

  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
  end

  def touch_in(station)
    fail "Cannot touch in: less than £#{MINIMUM_FARE} on card" if balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

  def top_up(amount)
    fail "Top up amount takes balance above £#{LIMIT} limit" if balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end




end
