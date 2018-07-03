def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	first_length = str.length
	# p str
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	str_length = new_str.length
	# p new_str
	if str_length == 13
		if first_length > 13
			"Invalid length-over 13"
		else 
			check_thirteen(num)
		end
	elsif first_length == 10
	# p str_length 
		if str_length == 10 && str.include?("x") == true
			check_x(num)
		elsif first_length == 10 && str_length == 10
			check_ten(num)
		else
			"Invalid ISBN"
		end
	else
		"Invalid ISBN"
	end
end

def check_x(num)
	new_array = []
	full_array = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	num_str = new_str.split(//)
	if num_str.length == 10 && num_str.include?("x") == true
		if num_str[0] == "x"
			"Invalid ISBN"
		elsif num_str[9] == "x"
			check_ten(num)
		else num_str[1]..num_str[8]
			"Invalid ISBN"
		end
	else
	check_ten(num)
	end
end

def check_thirteen(num)
	odds = []
	evens = []
	full_array = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	num_str = new_str.split(//)
	num_str.each do |x|
		full_array << x.to_i
	end
	popped = full_array.pop
	full_array.each_with_index do |item,index|
		if (index.odd?)
			odds.push(item*3)
		else (index.even?)
			evens.push(item)
		end
	end 
	sum = odds.sum+evens.sum
	mod = sum % 10
	remainder = 10 - mod
	if popped == remainder
		"Result-Valid ISBN"
	else
		"Result-Invalid ISBN"
	end
end

def check_ten(num)
	new_array = []
	full_array = []
	new_num_array = []
	value_arr = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	# p str
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# p new_str
	num_str = new_str.split(//)
	# p num_str
	popped_element = num_str.pop
	# p popped_element
	match_element = popped_element.to_i
	# p match_element
	match_element
	match_element
	# p num_str
	num_str.each do |x|
		full_array << x.to_i
	end
	full_array.each_with_index.map do |value,index|
		index +=1
		value_arr << value*index
	end
	sum = value_arr.sum
	remainder = sum%11
	# p remainder
	if match_element == remainder
		"Result-Valid ISBN"
	elsif popped_element == "x" && remainder == 10
		"Result-Valid ISBN"
	else
		"Result-Invalid ISBN"
	end
end

# p num_length("653256789a")
# p check_x("653256789a")
# p check_ten("653256789a")

# p num_length("98&25$47@6%548")
# p check_x("98&25$47@6%548")
# p check_ten("98&25$47@6%548")