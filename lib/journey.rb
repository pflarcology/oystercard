require_relative './oyster_card.rb'

class Journey

MIN_FARE = 1
PENALTY_FARE = 6

attr_accessor :journey_hash

  def initialize
    @journey_hash = Hash.new
  end



  def fare
    complete? ?  MIN_FARE : PENALTY_FARE
  end

  def start_journey(entry_station)
    @journey_hash[:start] = entry_station
  end

  def end_journey(exit_station)
    @journey_hash[:end] = exit_station
  end







end
