

require_relative "../karel/ur_robot"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"
# A class whose robots know how to sweep a short staircase of beepers
class StairSweeper < UrRobot
  include Turner
  include SensorPack
  attr_accessor :street, :avenue, :beepers

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

  def move_until
    if front_is_clear?
       move
    end 
  end

  def pickupline1
      if next_to_a_beeper?
        pick_beeper
        karel = StairSweeper.new(self.street, self.avenue, NORTH, 0)
      elsif front_is_clear?
        move
      else
        turn_right
        move
        turn_right
      end
  end

  def pickupline2
      if next_to_a_beeper?
        pick_beeper
       karel = StairSweeper.new(self.street, self.avenue, NORTH, 0)
      elsif front_is_clear?
        move
      else
        turn_left
        move
        turn_left
      end
  end

  def corners
      put_beeper
      put_beeper
      turn_left
      8.times do
        move
      end
      put_beeper
      put_beeper
      turn_left
      9.times do
        move
      end
      put_beeper
      put_beeper
      turn_left
      8.times do
        move
      end
      put_beeper
      put_beeper
      turn_left
      move
  end




  def allline
    112.times do
      if facing_north?
        pickupline1
      else
        pickupline2
      end
    end
  end

  # The standard task for this class of robots
 def run_task
    allline
    corners
    print self.beepers
  end
end
