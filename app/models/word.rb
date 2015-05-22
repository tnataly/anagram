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
	
	# return array of strings
	anagram = Array.new
	word_array.each do |a|
		anagram_to_test = a.join
		# to skip the word itself
		next if anagram_to_test.eql?(word)
		# if the new anagram is a real life word
		anagram << anagram_to_test if Word.find_by_text(anagram_to_test) 
	end
	# if there are no anagrams finded
	anagram << "NONE" if anagram.count < 1

	return anagram
end


end