class CartesianProduct
    include Enumerable
    # Your code here
    def initialize(x , y)
		@x, @y = x, y
    end
    
    def each()
		@x.each do |k|
			@y.each do |l|
				yield [k, l]
			end
		end
	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty
