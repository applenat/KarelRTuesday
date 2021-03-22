require 'byebug'

arr = []

100.times do
	arr << rand(1..100)
end

puts arr
ii=0
j=1
len = arr.length
puts "______________________"


while ii < len
	j = 1
	while j < (len - ii)
		if arr[j-1] > arr[j]
			tmp = arr[j]
			arr[j] = arr[j-1]
			arr[j-1] = tmp
		end
		j = j + 1
	end

	ii=ii+1
end

puts arr

finish = Time.now


