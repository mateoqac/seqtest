# frozen_string_literal: true

module Disbursements
  # ReportOperation class
  class ReportOperation < Pathway::Operation

    process do
      set :dispatch, to: :response
    end
    result_at :response

    private

    def dispatch(input:, **)
      if input[:merchant_id].present?
        Disbursements::MerchantReportOperation.call(context,input)
      else
        Disbursements::AllReportOperation.call(context,input)
      end
    end
  end
end
