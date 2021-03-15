

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
    turn_right
    move
  end
  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    turn_off
  end

  def put_line_1
    turn_right
    move
    move
    move
    move
    move
    move
    move
    put_beeper
  end

  def bot1
    turn_left
    move
    put_beeper
    put_line_1
    put_line_1
    put_line_1
    turn_right
    move
    turn_off
  end

  def put_line_2
    turn_right
    move
    move
    move
    move
    move
    move
    move
    put_beeper
    put_beeper
  end

  def bot2
    turn_left
    move
    put_beeper
    put_beeper
    put_line_2
    put_line_2
    put_line_2
    turn_right
    move
    move
    turn_off
  end

  def put_line_3
    turn_right
    move
    move
    move
    move
    move
    move
    move
    put_beeper
    put_beeper
    put_beeper
  end

  def bot3
    turn_left
    move
    put_beeper
    put_beeper
    put_beeper
    put_line_3
    put_line_3
    put_line_3
    turn_right
    move
    move
    move
    turn_off
  end


  # The standard task for this class of robots
 def run_task
    climb_stair
  end

end
