#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.

def palindrome?(str)
	str.downcase.gsub(/\W/, "") == str.reverse.downcase.gsub(/\W/, "")
end


def count_words(str)
	my_hash = Hash[str.downcase.scan(/\w+/).group_by{|t| t}.map{|x| [x[0], x[1].size]}]
end

#Tests palindrome?
palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")

#Tests count_words
count_words("A man, a plan, a canal -- Panama")
count_words ("Doo bee doo bee doo")
