class Plateau
  attr_reader :east_end, :north_end, :south_end, :west_end

  # Initializing the Plateau object
  def initialize(coordinates)
    @east_end, @north_end = coordinates.split(" ").map {|x| x.to_i}
    @south_end = 0
    @west_end = 0
  end
end