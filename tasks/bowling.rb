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
  def line_1
    put_beeper
    move
    move
    put_beeper
    move
    move
    put_beeper
    move
    move
    put_beeper 
  end

  def line_2
    
    turn_left
    move
    turn_left
    move
    put_beeper
    move
    move
    put_beeper
    move
    move
    put_beeper
    turn_left
    move
    move
    put_beeper
    turn_left
    move
    move
    put_beeper
    move
    move
    put_beeper
  end

  def line_3
    turn_right
    move
    turn_right
    move
    put_beeper
    move
    turn_left
    move
    put_beeper
    turn_left
    turn_left
    move
    turn_left
    move
    put_beeper
    turn_right
    move
    move
    move
    move
    put_beeper
    turn_right
    move
    turn_left
    move
    put_beeper
    turn_left
    turn_left
    move
    turn_left
    move
    put_beeper
  end

  def off
    move
    turn_right
    move
    move
    turn_right
  end

  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    move
    line_1
    line_2
    line_3
    off
    turn_off
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

end
