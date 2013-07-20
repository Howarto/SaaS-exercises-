class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end
 
 def in(money)
   singular_currency = money.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self / @@currencies[singular_currency]
	end
end
 
end



class String
	def palindrome?
		str = self.downcase.gsub(/[^\w]/ , "")
		str.reverse == str
	end
end

module Enumerable	#Isn't a class!
	def palindrome?
		object = self.each.collect { |x| x}
		object.reverse == object
	end
end

1.dollar.in(:rupee)
10.rupees.in(:euro)
1.dollars.method_missing(:euros) #LOL... I lost my time...is the same...
123.rupees.in(:yen).in(:dollar).in(:euros)

"foo".palindrome?
[1,2,3,2,1].palindrome? # => true

