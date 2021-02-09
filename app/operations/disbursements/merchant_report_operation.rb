# frozen_string_literal: true

module Disbursements
  # MerchantReportOperation class
  class MerchantReportOperation < Pathway::Operation
    params do
      required(:merchant_id).filled(:integer)
    end

    process do
      step :validate
      step :generate_reports
      set :load_reports, to: :reports
    end
    result_at :reports

    private

    def generate_reports(params:, **)
      DisbursementsJob.perform_later(week_of_year: params[:week_of_year], year:params[:year], merchant_id:params[:merchant_id])
    end

    def load_reports(params:, **)
      ::Disbursement.where(week_of_year: params[:week_of_year], year:params[:year], merchant_id: params[:merchant_id).all
    end
  end
end
