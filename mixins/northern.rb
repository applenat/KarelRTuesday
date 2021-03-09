module Northern

  # Turn right by executing three turn left actions
  def turn_right
    turn_left
    turn_left
    turn_left
  end
  
  # Turn around by executing two turn left actions
  def turn_around
    turn_left
    turn_left
  end
  
  # Back up by turning around, moving and again turning around. Robot
  # will be left facing the original direction. Might fail if there is 
  # a wall immediately behind the robot at the start. 
  def back_up
    turn_around
    move
    turn_around
  end

  def facing_north?
    return @direction == Robota::NORTH
  end
  
 # Return true if the robot is facing West
   def facing_west?
    return @direction == Robota::WEST
    turn_left
    turn_left
    turn_left
  end
  
 # Return true if the robot is facing South
   def facing_south?
    return @direction == Robota::SOUTH
    turn_left
    turn_left
  end
  
 # Return true if the robot is facing East
   def facing_east?
    return @direction == Robota::EAST
    turn_left
  end
end