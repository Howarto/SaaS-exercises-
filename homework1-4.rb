class Dessert
	attr_accessor :name
	attr_accessor :calories
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
	
    def healthy?
		if @calories < 200
			return true
		end
    end

    def delicious?
        return true
    end
end

prueba = Dessert.new('LaPrueba', 200)
prueba.name = 'Otro'

class JellyBean < Dessert
	attr_accessor :name
	attr_accessor :calories
	attr_accessor :flavor
    def initialize(name, calories, flavor)
        @name = name
        @calories = calories
        @flavor = flavor
    end

    def delicious?
		if @flavor == 'black licorice'
			return false
		else
			return true
		end
    end
end


