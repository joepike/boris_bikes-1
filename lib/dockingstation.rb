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
    # Bike.new
    raise "No bikes available" if @bikes.empty?
    #fail "No bikes available" unless @bikes
    @bikes.pop
  end
end
