def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	p "i am num  #{num}"
	# All letters in isbn will be converted to a lowercase character for filtration
	orig_str = num.downcase
	p "i am orig str #{orig_str}"
	# First gsub removes symbols
	str = orig_str.gsub(/([- ])/, '')
	# Gets length of the string after gsub that removes symbols
	first_length = str.length
	# new_str gsub keeps all numbers and letters
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# Gets length after removed symbols and remaining letters/digits
	str_length = new_str.length
	# If str_length(length after both gsubs) is equal to 13 then continue to next conditional
	if str_length == 13
		# If first_length(length after symbols are removed but before "x"'s and numbers are kept) is greater than 13...
		if first_length > 13
			#...then it is an invalid isbn
			"Invalid ISBN"
		else
			# Else go to the function that checks for isbn13
			check_thirteen(num)
		end
	# Else if the first_length(length after symbols are removed) is equal to 10 then go to folling conditional
	elsif first_length == 10
		# If length is 10 and the string includes an x then...
		if first_length == 10 && str.include?("x")
			# go to the function that checks for the postion of x
			check_x(num)
		elsif first_length == 10 && str_length == 10
			# else go to check_ten to find remainder, sum, and modulo
			check_ten(num)
		else
			"Invalid ISBN"
		end
	else
		# Else it is an Invalid ISBN
		"Invalid ISBN"
	end
end

def check_x(num)
	new_array = []
	full_array = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# Splits single digit into multiple charcters in individual strings. Ex: [1234] => ['1','2','3','4']
	num_str = new_str.split(//)
	# If the length is 10 and the string includes 'x' then continue to next conditional
	if num_str.length == 10 && num_str.include?("x")
		# If the x is located at the last position then go to check_ten function
		if num_str[9] == "x" && num_str[0] != "x"
			check_ten(num)
		# Else if the array contains an x in any other position then invalid message is given
		else num_str[1]..num_str[8]
			"Invalid ISBN"
		end
	else
		# Else go to check_ten function
		check_ten(num)
	end
end

# This function is for isbn 13 only
def check_thirteen(num)
	odds = []
	evens = []
	full_array = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	# p "string after symbols removed #{str}"
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# p "new_str check_thirteen after second gsub #{new_str}"
	num_str = new_str.split(//)
	# p "num_str check_thirteen after split #{num_str}"
	# Loop to change each element(that is in a string) to an integer
	num_str.each do |x|
		# Converts each element into\o9 integer then pushes into new array
		full_array << x.to_i
		# p "full array in conversion to integer #{full_array}"
	end
	# Pops off last element in array
	popped = full_array.pop
	# p "popped number #{popped}"
	# Iterates over each index
	full_array.each_with_index do |item,index|
		# Checks if index is odd
		if (index.odd?)
			# If so then multiply by 3 and psuh into odds array
			odds.push(item*3)
		# Else if the index is even then push into evens array
		else (index.even?)
			evens.push(item)
		end
	end
	# Gets sum of each array then adds both together
	sum = odds.sum+evens.sum
	# Gets modulo of the sum
	mod = sum % 10
	# Subtracts 10 from the mod
	remainder = 10-mod
	# If the popped off element is equal to the remainder then give valid isbn message
	if popped == remainder
		"Valid ISBN"
	else
		"Invalid ISBN"
	end
end

# This function is for isbn 10
def check_ten(num)
	new_array = []
	full_array = []
	new_num_array = []
	value_arr = []
	orig_str = num.downcase
	str = orig_str.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	num_str = new_str.split(//)
	# Pops off last element
	popped_element = num_str.pop
	# Converts popped element into integer
	match_element = popped_element.to_i
	num_str.each do |x|
		# Converts each element into integer then pushes into new array
		full_array << x.to_i
	end
	full_array.each_with_index.map do |value,index|
		# Starts at index 1 instead of 0
		index +=1
		# Multiplies the element by the index and pushes into new array
		value_arr << value*index
	end
	# Gets sum of values in array
	sum = value_arr.sum
	remainder = sum%11
	if match_element == remainder
		"Valid ISBN"
	elsif popped_element == "x" && remainder == 10
		"Valid ISBN"
	else
		"Invalid ISBN"
	end
end

# p num_length('92384767382')
