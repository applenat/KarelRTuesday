#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "test"
require_relative "../karel/robota"

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/bowling.txt")
  
  karel = StairSweeper.new(1, 2, Robota::NORTH, 20)
  karel.bot1()
  world.show_world_with_robots(1, 1, 6, 6)
  karel = StairSweeper.new(1, 2, Robota::NORTH, 20)
  karel.bot2()
  world.show_world_with_robots(1, 1, 6, 6)
  karel = StairSweeper.new(1, 2, Robota::NORTH, 20)
  karel.bot3()
  world.show_world_with_robots(1, 1, 6, 6)

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