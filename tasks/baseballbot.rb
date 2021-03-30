#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "baseball"
require_relative "../karel/robota"

# a task for a stair sweeper
def task()
  world = Robota::World
  world.read_world("../worlds/bowling.txt")
  karel = StairSweeper.new(1, 15, Robota::NORTH, 100)
  karel.baseball()
  world.show_world_with_robots(1, 1, 6, 6)
  karel.display()
  
end

if __FILE__ == $0
  if $graphical
     screen = window(30,100)# (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end