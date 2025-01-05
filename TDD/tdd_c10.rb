require 'test/unit'
include Test::Unit::Assertions

class Money
  attr_reader :amount
  def initialize(amount=nil, currency=nil)
    @amount=amount
    @currency=currency
  end
  
  def currency()
    return @currency
  end

  def equals(object)
    return @amount == object.amount && self.currency == object.currency
  end

  def dollar(amount)
    Dollar.new(amount, "USD")
  end

  def franc(amount)
    Franc.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end
    
end

class Dollar<Money
  # def times(multiplier)
  #   return Money.new.dollar(@amount * multiplier)
  # end
end


class Franc<Money
  # def times(multiplier)
  #   return Money.new.franc(@amount * multiplier)
  # end
end


five=Money.new.dollar(5)
five=five.times(2)
p(five.amount)
p(five.equals(Money.new.dollar(10)))
ten=Money.new.franc(10)
ten=ten.times(3)
p(ten.amount)
p(ten.equals(Money.new.franc(30)))