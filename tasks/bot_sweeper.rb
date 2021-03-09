#Copyright 2010 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License


require_relative "../karel/ur_robot"
require_relative "../mixins/turner"
# A class whose robots know how to sweep a short staircase of beepers
class StairSweeper < UrRobot
  include Turner
  def initialize (street, avenue, direction, beepers)
    super(street, avenue, direction, beepers)
  end
  
  # climb one stair
  def line_pickup
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
  end

  def line_left
    move
    turn_left
    move
    turn_left
  end

  def line_right
    move
    turn_right
    move
    turn_right
  end

  
  def sweep_stairs
    line_pickup
    line_left
    line_pickup
    line_right
    line_pickup
    line_left
    line_pickup
    line_right
    line_pickup
    line_left
    line_pickup
    move
    turn_off
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

end
