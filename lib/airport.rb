require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full' if planes.size == @capacity
    fail 'Plane has already landed' if plane.landed?
    plane.make_land
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at airport' unless @planes.include?(plane)
    # fail 'Cannot take off, weather is stormy' if stormy?
    plane.make_take_off
    @planes.delete(plane)
  end
end
