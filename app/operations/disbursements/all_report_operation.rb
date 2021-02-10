# frozen_string_literal: true

module Disbursements
  # AllReportOperation class
  class AllReportOperation < Pathway::Operation
    process do
      set :load_reports, to: :reports
    end
    result_at :reports

    private

    def load_reports(input:, **)
      ::Disbursement.where(week_of_year: input[:week], year:input[:year]).all
    end
  end
end
