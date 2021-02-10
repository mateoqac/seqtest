require 'rails_helper'

RSpec.describe GenerateDisbursement, :model do
  let(:subject) { described_class.new(params) }

  describe '#perform' do
    let(:params) do
      {
        orders_amounts: [20,30,50,100],
        merchant_id: 1,
        week: 14,
        year: 2018
      }
    end

    it 'should return an instance of Disbursement' do
      result = subject.perform
      expect(result).to be_a(Disbursement)
      expect(result.merchant_id).to eq(1)
      expect(result.week_of_year).to eq(14)
      expect(result.year).to eq(2018)
      expect(result.amount).to eq(198.075)
      expect(result.earnings).to eq(1.925)
    end
  end
end
