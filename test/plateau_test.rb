require 'test/unit'
require_relative("../lib/plateau")

class PlateauTest < Test::Unit::TestCase
  def test_it_set_the_limits_correctly
    plateau = Plateau.new("5 5")
    assert_equal 5, plateau.east_end
    assert_equal 5, plateau.north_end
    assert_equal 0, plateau.west_end
    assert_equal 0, plateau.south_end
  end
end
