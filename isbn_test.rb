require 'minitest/autorun'
require_relative 'isbn.rb'

class Isbn_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_num_length_valid_ten_digit_number
		num = "1235789543"
		assert_equal("Result-Valid ISBN",num_length(num))
	end

	def test_num_length_number_not_ten_digits
		num = "982547"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_remove_spaces_valid_ten_digit_number
		num = "12 357  89543"
		assert_equal("Result-Valid ISBN",num_length(num))
	end

	def test_remove_spaces_invalid_isbn
		num = "194 382 9087"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_remove_hyphens_and_spaces_valid_isbn
		num = "12 357  89-543"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_remove_hyphens_invalid_isbn
		num = "1-943-829-081"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_last_digit_is_x_at_end_valid_isbn
		num = "194382908x"
		assert_equal("Result-Valid ISBN",check_x(num))
	end

	def test_num_length_last_digit_is_X_at_end_valid_isbn
		num = "194382908X"
		assert_equal("Result-Valid ISBN",check_x(num))
	end

	def test_num_length_function_x_at_end_invalid
		num = "653256789x"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_function_X_at_end_invalid
		num = "653256789X"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_ten_digits_x_remainder_is_4_invalid
		num = "869543256x"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_ten_digits_X_remainder_is_4_invalid
		num = "869543256X"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_ten_digit_all_x_invalid
		num = "xxxxxxxxxx"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_check_X_ten_digit_all_X_invalid
		num = "XXXXXXXXXX"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_length_function_x_not_at_end
		num = "8254x67898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_letter_at_end
		num = "525789a"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_letters_not_at_end
		num = "65b32c56v7892"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_letter_at_end
		num = "653256789a"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_plus_letters_not_at_end
		num = "65b32c56789a3"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_with_parentheses
		num = "496(25)36"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_plus_parentheses
		num = "496(25)36859"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_with_symbols
		num = "9$8&25%47"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_plus_symbols
		num = "98&25$47@6%548"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_with_symbols_and_x_at_end
		num = "9$8&2547x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_plus_symbols_x_at_end
		num = "9%8&25$47@654x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_not_ten_digits_with_symbols_x_not_at_end
		num = "8$254x67#S898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_number_with_ten_digits_with_symbols_x_not_at_end
		num = "8$254x67#5898"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_check_x_last_digit_is_x_at_end_valid_isbn
		num = "194382908x"
		assert_equal("Result-Valid ISBN",check_x(num))
	end

	def test_check_x_last_digit_is_X_at_end_valid_isbn
		num = "194382908X"
		assert_equal("Result-Valid ISBN",check_x(num))
	end

	def test_check_x_function_x_at_end_invalid_isbn
		num = "653256789x"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_check_x_function_X_at_end_invalid_isbn
		num = "653256789X"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_check_x_function_x_not_at_end
		num = "8254x67898"
		assert_equal("Invalid ISBN",check_x(num))
	end

	def test_check_x_number_not_ten_digits
		num = "982547"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_check_x_ten_digit_all_x_invalid
		num = "xxxxxxxxxx"
		assert_equal("Invalid ISBN",check_x(num))
	end

	def test_check_x_ten_digit_all_X_invalid
		num = "XXXXXXXXXX"
		assert_equal("Invalid ISBN",check_x(num))
	end

	def test_check_x_function_not_ten_digits_with_parentheses
		num = "496(25)36"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_check_x_function_not_ten_digits_with_symbols
		num = "9$8&25%47"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_check_x_function_with_ten_digits_plus_parentheses
		num = "496(25)36859"
		assert_equal("Result-Invalid ISBN",check_x(num))
	end

	def test_invalid_isbn_with_ten_digits_plus_symbols
		num = "98&25$47@6%548"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_with_ten_digits_plus_symbols
		num = "25&467$89124"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_check_ten_comparison_invalid_isbn
		num = "7432456891"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_check_ten_comparison2_invalid_isbn
		num = "2546789123"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_check_ten_comparison3_invalid_isbn
		num = "2546789124"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_check_ten_comparison4_invalid_isbn
		num = "7432456493"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_check_ten_comparison_valid_isbn
		num = "6856972342"
		assert_equal("Result-Valid ISBN",check_ten(num))
	end

	def test_check_ten_last_digit_is_x_at_end_valid
		num = "194382908x"
		assert_equal("Result-Valid ISBN",check_ten(num))
	end

	def test_check_ten_last_digit_is_X_at_end_valid
		num = "194382908X"
		assert_equal("Result-Valid ISBN",check_ten(num))
	end


	def test_if_last_digit_is_x_at_end_invalid
		num = "869543256x"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_ten_digits_X_at_end_invalid
		num = "653256789X"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_ten_digits_X_remainder_is_not_10_invalid
		num = "869543256X"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_if_last_digit_is_x_remainder_is_not_10_invalid
		num = "869543254x"
		assert_equal("Result-Invalid ISBN",check_ten(num))
	end

	def test_valid_ten_digit_number_thirteen_in_length_with_spaces
		num = "123 578 9543"
		assert_equal("Result-Valid ISBN",num_length(num))
	end

	def test_with_thirteen_digit_places_valid_isbn
		num = "8325497862545"
		assert_equal("Result-Valid ISBN",check_thirteen(num))
	end

	def test_with_thirteen_digit_places_invalid_isbn
		num = "8325497862547"
		assert_equal("Result-Invalid ISBN",check_thirteen(num))
	end

	def test_with_thirteen_digit_with_spaces_valid_isbn
		num = "83 254 978 62545"
		assert_equal("Result-Valid ISBN",check_thirteen(num))
	end

	def test_with_thirteen_digit_with_spaces_invalid_isbn
		num = "978 0 471 48648 0"
		assert_equal("Result-Invalid ISBN",check_thirteen(num))
	end

	def test_with_thirteen_digit_with_hyphens_valid_isbn
		num = "832-54978-62545"
		assert_equal("Result-Valid ISBN",check_thirteen(num))
	end	

	def test_with_thirteen_digit_with_hyphens_invalid_isbn
		num = "832-54978-62542"
		assert_equal("Result-Invalid ISBN",check_thirteen(num))
	end

	def test_num_length_thirteen_digit_places_valid_isbn
		num = "8325497862545"
		assert_equal("Result-Valid ISBN",num_length(num))
	end

	def test_num_length_thirteen_digit_places_invalid_isbn
		num = "8325497862547"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_thirteen_digit_with_spaces_valid_isbn
		num = "83 254 978 62545"
		assert_equal("Result-Valid ISBN",num_length(num))
	end

	def test_num_length_thirteen_digit_with_spaces_invalid_isbn
		num = "978 0 471 48648 0"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_thirteen_digit_with_hyphens_valid_isbn
		num = "832-54978-62545"
		assert_equal("Result-Valid ISBN",num_length(num))
	end	

	def test_num_length_thirteen_digit_with_hyphens_invalid_isbn
		num = "832-54978-62542"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	def test_num_length_function_with_thirteen_and_parentheses
		num = "98(25)4766554"
		assert_equal("Invalid ISBN",num_length(num))
	end	

	def test_num_length_function_with_thirteen_and_symbols
		num = "98&25$47@6%54"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_invalid_isbn_thirteen_numbers_and_symbols
		num = "98&25$47@6%547895"
		assert_equal("Invalid length-over 13",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_parentheses_invalid
		num = "8325(49)7862545"
		assert_equal("Invalid length-over 13",num_length(num))
	end

	def test_isbn_with_thirteen_digits_and_x_on_end_invalid
		num = "8325497862545x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_letters_invalid
		num = "83254978a6254d5"
		assert_equal("Invalid length-over 13",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_letters_x_in_mid_end_invalid
		num = "8325497x8a6254d5x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_letters_x_on_end_invalid
		num = "83254978a6254d5x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_num_only_thirteen_numbers_and_symbols_invalid
		num = "83$2549@786%2545"
		assert_equal("Invalid length-over 13",num_length(num))
	end

	def test_valid_isbn_num_only_thirteen_numbers_invalid
		num = "83$25 49@78-6%2545"
		assert_equal("Invalid length-over 13",num_length(num))
	end

	def test_empty_string_invalid
		num = " "
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_all_letters_invalid
		num = "letters"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_x_on_end_invalid
		num = "8325497862545x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_valid_isbn_num_only_with_thirteen_and_X_on_end_invalid
		num = "8325497862545X"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_thirteen_digit_and_x_on_end_invalid
		num = "832549786254x"
		assert_equal("Result-Invalid ISBN",num_length(num))
	end

	


end