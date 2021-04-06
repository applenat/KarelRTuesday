require 'byebug'

arr = []

	arr << 5 
	arr << 6 
	arr << 2 
	arr << 66 
	arr << 5
	arr << 22
	arr << 6
	arr << 7
	arr << 8
	arr << 25
	arr << 72
	arr << 77777
	arr << 1


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

puts arr.length

finish = Time.now