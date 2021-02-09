# frozen_string_literal: true

class DisbursementsController < ApplicationController

  def report
    response = ::Disbursements::ReportOperation(context, params)
    render json: response
  end

  private

  def context
    {current_user: nil}
  end
end
