require_relative './journey.rb'

class JourneyLog

  # attr_accessor :journey
  #
  def initialize
    @journeys = []
  end


  attr_accessor :entry_station, :exit_station, :journeys

  def in_journey?
    !!entry_station && !exit_station
  end

  def start(first_station)
    start_journey = Journey.new
    start_journey.start_journey(first_station)
    # @journeys << start_journey
  end

  def end(exit_station)
    start_journey.end_journey(exit_station)
    @journeys << journey_hash
  end

  def complete?
    !!entry_station && !!exit_station
  end

  private

  def current_journey(first)

  end


end
