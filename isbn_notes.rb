def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	orig_str = num.downcase
	#Converts an uppercase "X" to lowercase
	str = orig_str.gsub(/([- ])/, '')
	#Removes spaces and hyphens
	first_length = str.length
	#Calculates the length after the spaces and hyphens are removed
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	#Removes any character that isn't a number or an "x"
	str_length = new_str.length
	#Calculates the length of "new_str"
	if str_length == 13
		#This checks ISBN that has 13 characters after the spaces,
		#hyphens, symbols, and any letters other than "x" have
		#been removed
		if first_length > 13
			"Invalid length-over 13"
			#Filters out any ISBN that is over 13 characters as invalid
		else 
			check_thirteen(num)
			#Will pass through check_thirteen function is 13 characters
		end
	elsif first_length == 10 
			#This checks ISBN that has 10 characters after the spaces 
			#and hyphens have been removed 
		if first_length == 10 && str.include?("x") == true
			check_x(num)
 			#Will pass through check_x function if 10 characters
			#and contains an "x" 
		else 
			check_ten(num)
			#Will pass through check_ten function if 10 characters
			#and doesn't contain an "x"
		end
	else
		"Invalid ISBN"
		#If the str_length of the ISBN is anything other than 13
		#characters and if the first_length of the ISBN is 
		#anything other than 10 characters, then it is invalid
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
			#If ISBN has "x" in the first position (index "0") it's invalid
		elsif num_str[9] == "x"
			check_ten(num)
			#If ISBN has "x" in the last position (index "9") 
			#it will pass through the check_ten function
		else num_str[1]..num_str[8]
			"Invalid ISBN"
			#If ISBN has "x" in any of the other positions it's invalid
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
	#ISBN is a string with 13 digits (numbers only or 
	#numbers with "x"(s))
	num_str = new_str.split(//)
	#Converts ISBN from a string with thirteen numbers (no
	#commas) to an array with each number separated with
	#a comma and each number as a separate string
	num_str.each do |x|
	#Iterates over each element in array...each separate number string
		full_array << x.to_i
		#Converts each number string to a an integer
		#and then pushes them into an array...each
		#number separated with a comma
	end
	popped = full_array.pop
	#Removes the last element (13th element) from the array
	full_array.each_with_index do |item,index|
	#Iterates over each element array
		if (index.odd?)
			#Isolates any number (item) in array with an 
			#odd index position
			odds.push(item*3)
			#Multiplies each number (item) in an odd index
			#position by 3 and pushes them into a
			#new array
		else (index.even?)
			#Isolates any number (item) in array with an 
			#even index position
			evens.push(item)
			#Pushes each number (item) in an even index
			#position into a new array 
		end 
	end
	sum = odds.sum+evens.sum
	#First obtains the sum of each of the two arrays
	#and then adds the two sums together to make one sum
	mod = sum % 10
	#The (modulus)remainder after dividing the one sum by 10 
	remainder = 10-mod
	#Subtracts the remainder from 10
	if popped == remainder
		"Result-Valid ISBN"
		#If the 13th digit (popped element) of the ISBN is 
		#the same as the remainder it's valid
	else
		"Result-Invalid ISBN"
		#If the 13th digit (popped element) of the ISBN is
		#not the same as the remainder it's invalid
	end
end

def check_ten(num)
	new_array = []
	full_array = []
	new_num_array = []
	value_arr = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	#ISBN is a string with 10 digits (numbers only or 
	#numbers with "x"(s))
	num_str = new_str.split(//)
	#Converts ISBN from a string with ten numbers (no
	#commas) to an array with each number separated with
	#a comma and each number as a separate string
	popped_element = num_str.pop
	#Removes the last element (10th element), 
	#whether it's a number or an "x", from the 
	#array (it's still a string)
	match_element = popped_element.to_i
	#Converts the last element(popped_element) from a 
	#string to an integer
	num_str.each do |x|
		#Iterates over each element (each number in a 
		#string) in the array 
		full_array << x.to_i
		#Converts each element into an integer and
		#pushes it into an array
	end
	full_array.each_with_index.map do |value,index|
		index +=1
		#Iterates over each element (integer) in the array
		value_arr << value*index
		#Multiplies the index (the counter 1,2,3,4,5,6,7,8,9) 
		#by each value (element)
		#Then pushes it into an array (value_arr)
	end
	sum = value_arr.sum
	#Adds each element of the array to obtain the sum 
	remainder = sum%11
	#The remainder (an integer) after the sum is divided by 11
	if match_element == remainder
		"Result-Valid ISBN"
		#If the last element (an integer) of the ISBN is the 
		#same as the remainder then it's valid
	elsif popped_element == "x" && remainder == 10
		"Result-Valid ISBN"
		#If the last element of the ISBN is an "x" and the 
		#remainder is 10 then it's valid
	else
		"Result-Invalid ISBN"
		#If neither of the above conditionals are met,
		#then it's invalid
	end
end