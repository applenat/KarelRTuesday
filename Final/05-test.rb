
require 'byebug'
require_relative "../karel/ur_robot"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"
require_relative "../karel/runner"


class Strategie
	def courir(robot)
		raise NotImplementedError.new(“Strategie pas implémenté”)
	end
end		
class NullStrategie < Strategie
	def courir(robot)
arr = []

10.times do 
	arr << rand(1..100)
end
start = Time.now
puts arr
puts '___________'
def sort(numbers)

	num_elements = numbers.length
	if num_elements <= 1
	  return numbers
	end

	half_of_elements = (num_elements / 2).round

	left  = numbers.take(half_of_elements)
	right = numbers.drop(half_of_elements)

	sorted_left = sort(left)
	sorted_right = sort(right)

	merge(sorted_left, sorted_right)
end

def merge(left_array, right_array)
	if right_array.empty?
	  return left_array
	end

	if left_array.empty?
	  return right_array
	end

	smallest_number = if left_array.first <= right_array.first
	  left_array.shift
	else
	  right_array.shift
	end

	recursive = merge(left_array, right_array)

	[smallest_number].concat(recursive)
end
puts arr

finish = Time.now
diff = finish - start
puts diff
	end
end	
class DeuxBlocStrategie < Strategie
	def courir(robot)
arr = []

10.times do
	arr << rand(1..100)
end

start = Time.now
puts arr
ii=0
j=1
len = arr.length
puts "______________________"


while ii < len -1
	j = ii + 1
	small = ii
	while j < (len)
		if arr[small] > arr[j]
			small = j
		end
		j = j + 1
	end
	tmp = arr[ii]
	arr[ii] = arr[small]
	arr[small] = tmp
		
	ii=ii+1
end

puts arr

finish = Time.now
diff = finish - start
puts diff

	end
end			
class TroisBlocStrategie < Strategie
	def courir(robot)
		block = []

10.times do
	block << rand(1..100)
end
		start = Time.now
puts block
ii=0
j=1
len = block.length
puts "______________________"


while ii < len
	j = 1
	while j < (len - ii)
		if block[j-1] < block[j]
			tmp = block[j]
			block[j] = block[j-1]
			block[j -1] = tmp
		end
		j = j + 1
	end

	ii=ii+1
end

puts block

finish = Time.now
diff = finish - start
puts diff

	end
end	

class RunnerRobot < UrRobot
	@runner_strategy = nil
	def initialize(street,avenue, direction, beepers)
		super(street,avenue, direction, beepers)
		@runner_strategy = NullStrategie.new()
	end
	def set_strategie(strategy)
		@runner_strategy = strategy
	end
	def courir
		@runner_strategy.courir(self)
	end
end
