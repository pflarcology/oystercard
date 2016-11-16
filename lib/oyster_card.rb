class Oystercard

attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if maximum_balance?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Card cannot be touched in: below £#{MINIMUM_BALANCE}" if minimum_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def minimum_balance?
    balance < MINIMUM_BALANCE
  end

end
