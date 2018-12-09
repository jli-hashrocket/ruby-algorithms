require 'pry-byebug'

def string_reverse(str)
	string_arr = str.split('')
	mid = str.length/2
	counter = 1

	reverse = string_arr.each_with_index do |char, index|
		if index != mid
			head_char = string_arr[index]
			tail_char = string_arr[string_arr.length - counter]
			string_arr[index] = tail_char
			string_arr[string_arr.length - counter] = head_char
			counter += 1
		else
			return puts string_arr.join
		end
	end
end

def recursive_reverse(str)
	return puts str if str.length == 1
	print str[str.length - 1] 
	recursive_reverse(str[0,str.length-1])
end


#string_reverse('mornings')
recursive_reverse('mornings')