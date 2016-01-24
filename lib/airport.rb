require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "It's too stormy to land!" if too_stormy?
    raise "Airport full!" if @planes.count >= @capacity
    # plane.land
    @planes << plane
  end

  def plane_takes_off(plane)
    # plane.take_off
    raise "It's too stormy to take off!" if too_stormy?
    @planes.delete(plane)
    @planes
  end

  def too_stormy?
    weather = Weather.new
    weather.stormy?
  end

end
