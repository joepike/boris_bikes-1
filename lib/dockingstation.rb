require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize()
    @bikes = []
  end

  def dock_bike(bike)
    @bikes << bike
  end

  def release_bike
    Bike.new
    # @bikes.empty? ? "There are no bikes" : @bikes.pop
  end
end
