require_relative './oyster_card.rb'

class Journey

MIN_FARE = 1
PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station, :journeys

  def initialize
    @entry_station
    @journeys = []
  end

  def in_journey?
    !!entry_station && !exit_station
  end

  def fare
    complete? ?  MIN_FARE : PENALTY_FARE
  end

  def complete?
    !!entry_station && !!exit_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end
# hope this works

end
