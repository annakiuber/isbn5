require 'csv'

def csv_open(isbn_array)
	CSV.open('isbn_file.csv', 'wb') do |csv|
		# csv << ["ISBN", "Status"]
		isbn_array.each do |isbn|
			# p isbn
			csv << isbn
		end
	end
end

# csv_open([["1234567890", "Invalid"],["54326", "Invalid"]])
p CSV.read("isbn_file.csv")
# csv_open("1234567890", "Invalid")
# csv_open("54326", "Invalid")