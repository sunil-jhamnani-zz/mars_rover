class Rover
  attr_reader :x_coordinate, :y_coordinate, :curr_direction

  # Initializing the Rover object
  def initialize(plateau, position)
    x, y, @curr_direction = position.split(" ")
    @x_coordinate = x.to_i
    @y_coordinate = y.to_i

    @plateau = Plateau.new(plateau)
  end

  # Method to execute the instructions
  #:@params series: String
  def exec_instructions(series)
    series.split("").each {|command| action(command)}
    "#{@x_coordinate} #{@y_coordinate} #{@curr_direction}"
  end

  # Perform the actions with respect to the command provided
  #:@params command: String
  def action(command)
    case command
      when 'M' then move
      when 'L' then turning_left
      when 'R' then turning_right
    end
  end

  # Turn the rover to left
  def turning_left
    @curr_direction = case @curr_direction
                        when 'N' then 'W'
                        when 'W' then 'S'
                        when 'S' then 'E'
                        when 'E' then 'N'
                      end
  end

  # Turn the rover to right
  def turning_right
    @curr_direction = case @curr_direction
                        when 'N' then 'E'
                        when 'E' then 'S'
                        when 'S' then 'W'
                        when 'W' then 'N'
                      end
  end

  # Move the rover 1 step ahead wrt the current position
  def move
    x, y = case @curr_direction
             when 'N' then [0, 1] unless cannot_move?
             when 'W' then [-1, 0] unless cannot_move?
             when 'S' then [0, -1] unless cannot_move?
             when 'E' then [1, 0] unless cannot_move?
           end

    @x_coordinate += x
    @y_coordinate += y
  end

  # Check if rover can move further or not
  def cannot_move?
    case @curr_direction
      when 'N' then @y_coordinate == @plateau.north_end ? true : false
      when 'S' then @y_coordinate == @plateau.south_end ? true : false
      when 'W' then @x_coordinate == @plateau.west_end ? true : false
      when 'E' then @x_coordinate == @plateau.east_end ? true : false
    end
  end
end