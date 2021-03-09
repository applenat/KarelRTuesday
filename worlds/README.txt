These are all of the world files for the book. The files are text files with DOS end lines. 

KarelWorld
beepers 3 3 1
beepers 2 2 1
beepers 4 4 1
eastwestwalls 1 2 2
eastwestwalls 3 4 4
eastwestwalls 2 3 3
northsouthwalls 3 3 3
northsouthwalls 2 2 2
northsouthwalls 4 1 1
northsouthwalls 4 3 3
northsouthwalls 4 2 2
northsouthwalls 1 1 1

#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "stair_sweeper"
require_relative "../karel/robota"

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/stair_world.txt")
  
  karel = StairSweeper.new(1, 1, Robota::EAST, 0)
  karel.sweep_stairs()
  world.show_world_with_robots(1, 1, 6, 6)
  karel.display()
  
end

if __FILE__ == $0
  if $graphical
     screen = window(8, 40) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end

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
    turn_right
    move
  end
  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    climb_stair
    pick_beeper
    climb_stair
    pick_beeper
    climb_stair
    pick_beeper
    turn_off
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

end