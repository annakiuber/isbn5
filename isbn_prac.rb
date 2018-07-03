def num_length(num)
	new_array = []
	full_array = []
	new_num_array = []
	str = num.gsub(/([- ])/, '')
	invalid_str = str.length
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	p new_str
	str_length = new_str.length
	if str_length == 13
		if invalid_str > 13 
			"Invalid length over 13"
		else  
			check_thirteen(num)
		end
	elsif str_length > 10 && str_length < 13
		"Invalid length 11/12"
		num_str = str.split(//)
		array = num_str.join
		p array
		array_length = array.length
	elsif array_length == 10 && array.include?("x") == true
			check_x(num)
		# elsif array_length == 10 && array.include?("x") == false
			# full_array << array.to_i
			# new_num = num_str.pop
			# joined_number = num_str.join
			# new_num_array << joined_number.to_i

		# else
			# check_ten(num)
		# 	# "Invalid ISBN"
		# end
	elsif str_length < 10 
		"Invalid length"
		# check_x(num)
	else
		check_ten(num)
	end
end

def check_x(num)
	new_array = []
	str = num.gsub(/[^Xx0-9 ]/, '')
	num_str = str.split(//)
	p num_str
	if num_str.length == 10 && num_str[9] == "x"
		partial_array = num_str.pop
		new_array << num_str.join.to_i
		check_ten(num)
		# else num_str[0]..num_str[8] == "x"
		# "Invalid ISBN"
		# end
	else
	"Invalid ISBN"
	end
end

def check_thirteen(num)
	odds = []
	evens = []
	full_array = []
	str = num.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	num_str = new_str.split(//)
	num_str.each do |x|
		full_array << x.to_i
	end
	popped = full_array.pop
	# p full_array
	full_array.each_with_index do |item,index|
		if (index.odd?)
			odds.push(item*3)
		else (index.even?)
			evens.push(item*1)
		end
	end
	sum = odds.sum+evens.sum
	mod = sum % 10 
	remainder = 10-mod
	# p remainder
	if popped == remainder
		"Result-Valid ISBN"
	else
		"Result-Invalid ISBN"
	end
end

def check_ten(num)
	answer_array = []
	new_array = []
	full_array = []
	new_num_array = []
	str = num.gsub(/([- ])/, '')
	new_str = str.gsub(/[^Xx0-9 ]/, '')
	# p new_str
	str_length = new_str.length
	num_str = str.split(//)
	p num_str
	match_element = num_str[9].to_i
	p match_element
	numbers = num_length(num)
	p numbers
  	new_num = numbers.zip([1,2,3,4,5,6,7,8,9])
	new_num.map! do |v,i|
	  answer = v*i
	  answer_array << answer 	
	end
	  sum = answer_array.sum
	  remainder = sum%11
	  p remainder
		if match_element == remainder
			"Result-Valid ISBN"
		elsif num_str[9] == "x" && remainder == 10
			"Result-Valid ISBN"
		else
			"Result-Invalid ISBN"
		end
end





# p check_sum("7421394761")
# p multiply_places("8325497862547")
# p multiply_places("9780470059029")
# p multiply_places("978 0 471 48648 0")
# p num_length("8325497862598")
# p num_length("83(254)97862598")
# p num_length("832549786259x")
# p num_length("1235789543")
p num_length("653256789x")
# p num_length("65325")

# p check_ten("7432456497")
# p check_sum("2546789123")
# p check_sum("6856972348")
# p check_sum("6856972342")
# p check_sum("685697234x")
# p check_sum("869543256x")