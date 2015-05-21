# It takes an array of letters & reverse it 
def reverse_letters(input_letters)
	reverse_letters = Array.new
	i = 1
	input_letters.each do |letter|
		reverse_letters[input_letters.length - i] = letter
		i += 1
	end
	return reverse_letters
end

#p reverse_letters(["a","b","c"])