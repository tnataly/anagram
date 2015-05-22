class Word < ActiveRecord::Base
# It takes an array of letters & reverse it 
def self.reverse_letters(input_letters)
	reverse_letters = Array.new
	i = 1
	input_letters.each do |letter|
		reverse_letters[input_letters.length - i] = letter
		i += 1
	end
	return reverse_letters
end


# Finds all anagrams of given word(string)
def self.find_anagrams(word)
	# split string to array & find all possible permutations
	word_array = word.split("").permutation.to_a
	
	# return array of strins
	anagram = Array.new
	word_array.each do |a|
		anagram << a.join
	end
	
	return anagram
end


end