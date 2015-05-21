require_relative 'reverse_letters'

# Finds all anagrams of given word(string)
def find_anagram(word)
	# split string to array & find all possible permutations
	word_array = word.split("").permutation.to_a
	
	# return array of strins
	anagram = Array.new
	word_array.each do |a|
		anagram << a.join
	end
	
	return anagram
end
#find_anagram("queen").each do |a|
	p find_anagram("queen")
#end