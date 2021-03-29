require 'byebug'

arr = []

9000.times do
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
