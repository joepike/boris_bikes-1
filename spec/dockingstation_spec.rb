require 'dockingstation'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'returns an error when no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it 'releases bikes' do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.is_a?(Bike)).to eq true
    end

    it 'cannot release a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock_bike(bike)
      expect{ subject.release_bike }.to raise_error "Cannot release a broken bike"
    end
end

  describe 'initilization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new 50
      50.times { docking_station.dock_bike Bike.new }
      expect { docking_station.dock_bike Bike.new }.to raise_error "Docking station full"
    end
    it 'docking station initializes with a default capacity' do
      docking_station = DockingStation.new
      expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
    it 'sets the capacity' do
      docking_station = DockingStation.new 50
      expect(docking_station.capacity).to eq(50)
    end
    it 'adds a bike to test dock full after initialization' do
      docking_station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock_bike Bike.new }
      expect { docking_station.dock_bike Bike.new }.to raise_error "Docking station full"
    end
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe '#dock_bike' do
    it 'docks bikes' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to include bike
    end
    it 'returns an error when docking station full' do
      subject.capacity.times { subject.dock_bike(Bike.new) }
      expect { subject.dock_bike(Bike.new) }.to raise_error "Docking station full"
    end
    it 'accepts broken bike' do
      bike = Bike.new
      bike.report_broken
      expect(subject.dock_bike(bike)).to include bike
    end
  end
end
