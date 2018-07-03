require 'minitest/autorun'
require_relative 'isbn.rb'

class Isbn_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_no_spaces
		num = "1943 829081"
		assert_equal([194382908],num_length(num))
	end

	def test_in_numlength_invalid_isbn
		num = "194 382 908x"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_num_cap
		num = "194382908x"
		assert_equal([194382908],num_length(num))
	end

	def test_remove_hyphens
		num = "1-943-829-08x"
		assert_equal([194382908],num_length(num))
	end
  def test_for_extrasymbol
    num = "1-674-78@-67x"
    assert_equal("Invalid ISBN",num_length(num))
  end
  def test_for_extrasymbol2
    num = "4-879-89$-23*"
    assert_equal("Invalid ISBN",num_length(num))
  end
	def test_validnumber
		num = "978-1-891830"
		assert_equal("Result-Invalid ISBN", check_sum(num))
	end
	def test_validnumber2
		num = "7816030941"
		assert_equal("Result-Invalid ISBN", check_sum(num))
	end


	def test_num_cap_function_with_ten_digits_plus_parentheses
		num = "496(25)36859"
		assert_equal("Invalid ISBN",num_cap(num))
	end

	def test_num_cap_function_with_ten_digits_plus_symbols
		num = "98&25$47@6%548"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_check_sum_comparison_invalid_isbn
		num = "7432456891"
		assert_equal("Result-Invalid ISBN",check_sum(num))
	end

	def test_check_sum_comparison2_invalid_isbn
		num = "2546789123"
		assert_equal("Result-Invalid ISBN",check_sum(num))
	end

	def test_check_sum_comparison3_invalid_isbn
		num = "6856972348"
		assert_equal("Result-Invalid ISBN",check_sum(num))
	end

	def test_check_sum_comparison_valid_isbn
		num = "2546789124"
		assert_equal("Result-Valid ISBN",check_sum(num))
	end

	def test_check_sum_comparison2_valid_isbn
		num = "6856972342"
		assert_equal("Result-Valid ISBN",check_sum(num))
	end

	def test_check_sum_comparison3_valid_isbn
		num = "7432456493"
		assert_equal("Result-Valid ISBN",check_sum(num))
	end

	def test_if_last_digit_is_x_checksum_is_10
		num = "869543256x"
		assert_equal("Result-Valid ISBN",check_sum(num))
	end

	def test_if_13
		num = "7896532-745352"
		assert_equal(134,multiply_places(num))
	end

	def test_13forrandom
		num = "1456@$*6787678"
		assert_equal("Invalid ISBN",num_length(num))
	end

	def test_13forrandom_multiplyplaces
		num = "1456@$*6787678"
		assert_equal("Invalid ISBN",multiply_places(num))
	end


end
