class AmountDisbursedAfterFee

  def initialize(amount)
    @amount = amount
  end

  def perform
    fee =  case
            when amount < 50
              amount * 0.01
            when (50..300) === amount
              amount * 0.0095
            when amount > 300
              amount * 0.0085
            end
    (amount - fee).round(5)
  end

  private

  attr_accessor :amount
end
