#HOMEWORK 1-3

def combine_anagrams(words)
	anagram = words.each_with_object(Hash.new([])) do |word, hash|
		hash[word.downcase.chars.sort] += [word]
	end
	return anagram.values
end
input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 

combine_anagrams(input)

# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]
