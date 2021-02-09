class Order < ApplicationRecord
  validates :amount, presence: true
  
  belongs_to :shopper
  belongs_to :merchant
end
