
require 'byebug'
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

  def safe_move
    if front_is_clear?
       move
    end 
  end

  def safe_pick
    if next_to_a_beeper
      pick_beeper
    end
  end

  def safe_put
    if any_beepers_in_beeper_bag?
      put_beeper
    end
  end

  def line
    12.times do
    move
    turn_right
    move
    put_beeper
    turn_left
    end
    turn_left
  end

  def bases
    move
    move
    4.times do
      middle
      next_base
      put_beeper
      turn_left
      turn_left
    end
  end

  def middle
    10.times do
      move
    end
  end

  def next_base
    turn_right
    10.times do
      move
    end
  end

  def all_lines
    4.times do
      line
    end
  end

  def baseball
    all_lines
    bases
  end

  def sommative_03
    matrice = [0]
    ii=0
      12.times do
        move
          10.times do
          if next_to_a_beeper?
          pick_beeper
          ii=ii+1
          end
      end
      matrice << ii
      ii.times do
      put_beeper
    end
    ii=0
  end
  puts matrice
  puts "______________"
      j=12
    turn_right
    move
    turn_right
      12.times do
        ii = matrice[j]
          ii.times do
            put_beeper
          end
          move
          j=j-1
      end
  end
end
