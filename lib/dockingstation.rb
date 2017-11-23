require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    raise "Cannot release a broken bike" if @docked.bikes.last.broken?
    @docked.bikes.pop
  end

  private

  def full?
    @docked.bikes.count == capacity
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
