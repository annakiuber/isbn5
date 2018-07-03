def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	str = num.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	str_length = new_str.length
	if str_length == 13
		multiply_places(num)
	elsif str_length == 10
		num_str = str.split(//)
		# p num_str
		array = num_str.join
		# p array
		array_length = array.length
		if array_length == 10 && array.include?("x") == true
			num_cap(num)
		elsif array_length == 10
			full_array << array.to_i
			new_num = num_str.pop
			joined_number = num_str.join
			new_num_array << joined_number.to_i
			# p new_num_array
		else
			"Invalid ISBN"
		end
	elsif str_length < 10 || str_length > 10
		num_cap(num)
	else
		check_sum(num)
	end
end

def multiply_places(num)
	odds = []
	evens = []
	full_array = []
	str = num.gsub(/[^Xx0-9 ]/, '')
	# p "str after gsub #{str}"
	num_str = str.split(//)
	# p "num str after split #{num_str}"
	array = num_str.join
	full_array << array.to_i
	# p "full arr#{full_array}"
	full_array.each_with_index do |item,index|
		if (index.odd?)
			odds.push(item*3)
		else (index.even?)
			evens.push(item*1)
		end
	end
	sum = odds.sum+evens.sum
end
