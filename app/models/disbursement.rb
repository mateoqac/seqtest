class Disbursement < ApplicationRecord
  validates :amount, :earnings, :week_of_year, :year, presence: true

  belongs_to :merchant
end
