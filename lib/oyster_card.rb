require_relative './journey.rb'

class Oystercard


attr_reader :balance, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if maximum_balance?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(xyz)
    fail "Card cannot be touched in: below £#{MINIMUM_BALANCE}" if minimum_balance?
    @journey.entry_station = xyz
  end

  def touch_out(exit_station)
    @journey.journeys << { :entry_station =>  @journey.entry_station, :exit_station => exit_station }
    @journey.finish(exit_station)
  end

  private

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def minimum_balance?
    balance < MINIMUM_BALANCE
  end

end
