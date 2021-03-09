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
  
  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    move
    move
    put_beeper
    turn_left
    move
    put_beeper
    move
    put_beeper
    move
    put_beeper
    move
    put_beeper
    turn_left
    move
    move
    turn_left
    move
    move
    turn_left
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

end