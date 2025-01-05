require 'test/unit'
include Test::Unit::Assertions


module Expression
  def plus(addend)
    return Money.new(@amount+addend.amount, @currency)
  end
end

class Bank
  def reduce(source, to)
    return Money.new.dollar(10)
  end
end


class Money
  include Expression
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
    Money.new(amount, "USD")
  end

  def franc(amount)
    Money.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  # def plus(addend)
  #   return Money.end(@amount+addend.amount, currency)
  # end


    
end




five=Money.new.dollar(5)
sum=five.plus(five)
p(sum)
bank=Bank.new
reduced=bank.reduce(sum, "USD")
p(reduced)
p(reduced.equals(Money.new.dollar(10)))