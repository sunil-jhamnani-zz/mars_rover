require 'test/unit'
require_relative("../lib/rover")
require_relative("../lib/plateau")

class RoverTest < Test::Unit::TestCase

  def test_it_set_the_position_correctly
    rover = Rover.new("5 5", "1 2 N")
    assert_equal 1, rover.x_coordinate
    assert_equal 2, rover.y_coordinate
    assert_equal 'N', rover.curr_direction
  end

  def test_it_executes_instructions
    rover = Rover.new("5 5", "1 2 N")

    status = rover.exec_instructions("LMLMLMLMM")
    assert_equal "1 3 N", status

    rover = Rover.new("5 5", "3 3 E")

    status = rover.exec_instructions("MMRMMRMRRM")
    assert_equal "5 1 E", status
  end

  def test_action_when_command_is_M
    rover = Rover.new("5 5", "1 2 N")
    rover.action("M")

    assert_equal 2 + 1, rover.y_coordinate
  end

  def test_action_when_command_is_L
    rover = Rover.new("5 5", "1 2 N")
    rover.action("L")

    assert_equal 'W', rover.curr_direction
  end

  def test_action_when_command_is_R
    rover = Rover.new("5 5", "1 2 N")
    rover.action("R")

    assert_equal 'E', rover.curr_direction
  end

  def test_turning_left_when_current_position_is_North
    rover = Rover.new("5 5", "1 2 N")
    rover.turning_left

    assert_equal 'W', rover.curr_direction
  end

  def test_turning_left_when_current_position_is_South
    rover = Rover.new("5 5", "1 2 S")
    rover.turning_left

    assert_equal 'E', rover.curr_direction
  end

  def test_turning_right_when_current_position_is_North
    rover = Rover.new("5 5", "1 2 N")
    rover.turning_right

    assert_equal 'E', rover.curr_direction
  end

  def test_turning_right_when_current_position_is_South
    rover = Rover.new("5 5", "1 2 S")
    rover.turning_right

    assert_equal 'W', rover.curr_direction
  end
end