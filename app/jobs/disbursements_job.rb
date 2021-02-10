# frozen_string_literal: true

class DisbursementsJob < ApplicationJob
  queue_as :default

  def perform(week: week, year: year)
    start_date = DateTime.commercial(year, week, 1,0) # lunes a las 00:00:00
    end_date = (start_date + 7.days) - 1.second # hasta el domingo 23:59:59

    Merchant.pluck(:id).each do |merchant_id|
      orders_amounts = Order.completed.where(:completed_at => start_date..end_date).
                where(merchant_id: merchant_id).
                pluck(:amount)
      next if  orders_amounts.empty?

      params = {
        merchant_id: merchant_id,
        week: week,
        year: year,
        orders_amounts: orders_amounts
      }
      GenerateDisbursement.new(params).perform
    end
  end
end
