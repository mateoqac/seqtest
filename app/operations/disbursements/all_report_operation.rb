# frozen_string_literal: true

module Disbursements
  # AllReportOperation class
  class AllReportOperation < Pathway::Operation
    process do
      step :generate_reports
      set :load_reports, to: :reports
    end
    result_at :reports

    private

    def generate_reports(params:, **)
      DisbursementsJob.perform_later(week_of_year: params[:week_of_year], year:params[:year])
    end

    def load_reports(params:, **)
      ::Disbursement.where(week_of_year: params[:week_of_year], year:params[:year]).all
    end
  end
end
