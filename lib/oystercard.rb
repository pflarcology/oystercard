class Oystercard

  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def in_journey?
    false
  end

  def top_up(amount)
    fail "Top up amount takes balance above £#{LIMIT} limit" if balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
