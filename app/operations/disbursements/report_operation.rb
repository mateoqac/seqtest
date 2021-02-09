# frozen_string_literal: true

module Disbursements
  # ReportOperation class
  class ReportOperation < Pathway::Operation
    params do
      required(:week_of_year).filled(:integer)
      required(:year).filled(:integer)
      optional(:merchant_id).filled(:integer)
    end

    process do
      step :validate
      set :dispatch, to: :response
    end
    result_at :response

    private

    def dispatch(params:, **)
      if params[:merchant_id].present?
        Disbursements::MerchantReportOperation.call(context,params)
      else
        Disbursements::AllReportOperation.call(context,params)
      end
    end
  end
end
