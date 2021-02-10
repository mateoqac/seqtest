class Disbursement < ApplicationRecord
  validates :amount, :earnings, :week_of_year, :year, presence: true

  belongs_to :merchant

  def to_json
    {
      amount: amount,
      earnings: earnings,
      merchant: merchant_id,
      week: week_of_year,
      year: year
    }
  end
end
