require 'test/unit'
include Test::Unit::Assertions


module Expression
  def plus(addend)
    return Sum.new(this, addend)
  end
end

class Bank
  def reduce(source, to)
    sum=source
    # amount=sum.augend.amount+sum.addend.amount
    # return Money.new(amount, to)
    return sum.reduce(to)
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

end

class Sum
  include Expression
  def initialize(augend, addend)
    @augend=augend
    @addend=addend
  end
  def reduce(to)
    amount=@augend.amount+@addend.amount
    return Money.new(amount, to)
  end
end





# five=Money.new.dollar(5)
# result=five.plus(five)
sum=Sum.new(Money.new.dollar(3), Money.new.dollar(4))
bank=Bank.new()
result=bank.reduce(sum, "USD")
p(Money.new.dollar(7),result)
p(Money.new.dollar(7).equals (result))
# p(five.equals(sum.augend))
# p(five.equals(sum.addend))