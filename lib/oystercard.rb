class Oystercard

  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Cannot touch in: less than £#{MINIMUM_FARE} on card" if balance < MINIMUM_FARE
    @entry_station = station
    @exit_station = nil
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station
  end

  def top_up(amount)
    fail "Top up amount takes balance above £#{LIMIT} limit" if balance + amount > LIMIT
    @balance += amount
  end

  private

  def deduct(fare)
    @balance -= fare
  end




end
