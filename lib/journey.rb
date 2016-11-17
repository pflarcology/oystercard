require_relative './oyster_card.rb'

class Journey

MIN_FARE = 1
PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station, :journeys

  def initialize
    @entry_station
    @exit_station
    @journeys = []
  end

  def in_journey?
    !!@entry_station
  end

  def fare
    @entry_station == nil ? PENALTY_FARE : MIN_FARE
  end
end
