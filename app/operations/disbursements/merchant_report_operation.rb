# frozen_string_literal: true

module Disbursements
  # MerchantReportOperation class
  class MerchantReportOperation < Pathway::Operation

    process do
      set :search_report, to: :reports
    end
    result_at :reports

    private

    def search_report(input:, **)
      ::Disbursement.where(week_of_year: input[:week], year:input[:year], merchant_id: input[:merchant_id])&.first
    end
  end
end
