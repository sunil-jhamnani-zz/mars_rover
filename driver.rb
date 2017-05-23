require_relative("lib/plateau.rb")
require_relative("lib/rover.rb")

$ROVERS= []
puts "Enter plateau coordinate (Eg: '5 5'):"
plateau_cord = gets.chomp

loop {
  puts "Enter rovers information (Eg: '1 2 S') or Press N to exit:"
  rover_info = gets.chomp
  if rover_info == 'N'
    break
  end
  begin
    rover = Rover.new(plateau_cord, rover_info)
  rescue Exception => ex
    puts "Rover already present on this location"
    next
  end

  $ROVERS.push(rover)
  loop {
    puts 'Enter a pattern to move this rover'
    pattern = gets.chomp
    begin
      status = rover.exec_instructions(pattern)
    rescue
      puts "Rover already present on this location. Please change your pattern"
      next
    end
    puts "Current location of rover: " + status
    break
  }
}
