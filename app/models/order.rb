class Order < ApplicationRecord
  validates :amount, presence: true

  belongs_to :shopper
  belongs_to :merchant

  scope :completed, -> {where.not(completed_at: nil)}
end
