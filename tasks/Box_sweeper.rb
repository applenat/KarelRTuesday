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
  def climb_stair
    turn_left
    move
    move
    move
  end
  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    turn_left
    move
    move
    move
    turn_right
    move
    move
    move
    turn_right
    move
    move
    move
    turn_right
    move
    move
    move
    turn_left
    turn_left
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

end