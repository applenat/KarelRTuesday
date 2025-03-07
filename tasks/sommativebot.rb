#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "sommative"
require_relative "../karel/robota"

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/rangee.kwld")
  karel = StairSweeper.new(1, 3, Robota::NORTH, 100)
  karel.sommative_03()
  world.show_world_with_robots(1, 1, 6, 6)
  karel.display()
  
end

if __FILE__ == $0
  if $graphical
     screen = window(30,40)# (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end