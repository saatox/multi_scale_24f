require 'test/unit'
include Test::Unit::Assertions

class Money
    attr_reader :amount

    def equals(object)
        return @amount == object.amount && self.class == object.class
    end
    def Dollartimes(multiplier)
        return Dollar.new(@amount * multiplier)
    end
    def Franctimes(multiplier)
        return Franc.new(@amount * multiplier)
    end
    def dollar(amount)
        Dollar.new(amount)
    end
    def franc(amount)
        Franc.new(amount)
    end
end

class Dollar<Money
    # attr_reader :amount
    def initialize(amount)
      @amount= amount
    end
    # def times(multiplier)
    # #   @amount*= multiplier
    # # ^^for chapter 1
    #   Dollar.new(@amount * multiplier)
    # end
    # def equals(object)
    #     return @amount == object.amount
    # end
  end


class Franc<Money
    # attr_reader :amount
    def initialize(amount)
      @amount= amount
    end
    # def times(multiplier)
    # #   @amount*= multiplier
    # # ^^for chapter 1
    #   return @amount * multiplier
    # end
    # def equals(object)
    #     return @amount == object.amount
    # end
  end


# five=Dollar.new(5)
# five.times(2)
# assert_equal(10, five.amount)
#---------Chapter 1----------------------
# five=Dollar.new(5)
# product=five.times(3)
# assert_equal(15, product.amount)
#---------Chapter 2----------------------
# p(product.equals(five))
# p(product.equals(Dollar.new(15)))
#---------Chapter 3----------------------
# five=Dollar.new(5)
# # product=five.times(2)
# assert_true Dollar.new(10).equals product
# p(Dollar.new(10).equals(product))
#---------Chapter 4----------------------
# five=Franc.new(5)
# assert_equal(five.times(3), Franc.new(15).amount)
#---------Chapter 5----------------------
# assert_true(Dollar.new(5).equals(Dollar.new(5)))
# assert_false(Franc.new(5).equals(Franc.new(15)))
#---------Chapter 6----------------------
# assert_true(Franc.new(5).equals(Dollar.new(5)))
# p(Dollar.new(10).equals(Franc.new(10)))
#---------Chapter 7----------------------
five=Money.new.dollar(5)
five=five.Dollartimes(2)
p(five.amount)
p(five.equals(Dollar.new(10)))
ten=Money.new.franc(10)
ten=ten.Franctimes(3)
p(ten.amount)
p(ten.equals(Franc.new(30)))