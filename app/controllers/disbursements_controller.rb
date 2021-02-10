# frozen_string_literal: true

class DisbursementsController < ApplicationController

  def report
    response = ::Disbursements::ReportOperation.call(context, strong_params)
    render json: jsonaize(response)
  end

  private

  def context
    {current_user: nil}
  end

  def jsonaize(response)
    return response.to_json unless response.instance_of?(Array)
    response.map(&:to_json)
  end

  def strong_params
    params.permit(:week,:year,:merchant_id)
  end
end
