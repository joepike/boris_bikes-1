require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize()
    @docked = Docked.new
  end

  def dock_bike(bike)
    raise "Docking station full" if full?
    @docked.bikes << bike
  end

  def release_bike
    # Bike.new
    raise "No bikes available" if empty?
    #fail "No bikes available" unless @docked.bikes
    @docked.bikes.pop
  end

  private

  def full?
    @docked.bikes.count == 20 ? true : false
  end

  def empty?
    @docked.bikes.empty?
  end

end

class Docked
  attr_reader :bikes

  def initialize()
    @bikes = []
  end

end
