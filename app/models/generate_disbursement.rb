class GenerateDisbursement

  def initialize(params)
    @params = params
  end

  def perform
    sum_disbursement = params[:orders_amounts].map { |amount| AmountDisbursedAfterFee.new(amount).perform}.sum.round(5)
    original_amount = params[:orders_amounts].sum.round(5)
    earnings = (original_amount - sum_disbursement).round(5)
    Disbursement.create(amount: sum_disbursement, earnings:earnings, merchant_id: params[:merchant_id],
                        week_of_year: params[:week], year: params[:year])
  end

  private

  attr_accessor :params
end
