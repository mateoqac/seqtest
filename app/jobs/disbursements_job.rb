# frozen_string_literal: true

class DisbursementsJob < ApplicationJob
  queue_as :default

  def perform(week_of_year:,year:,merchant_id: nil)
    # Do something later
  end
end
