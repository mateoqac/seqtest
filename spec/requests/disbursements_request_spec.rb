require 'rails_helper'

RSpec.describe "Disbursements", type: :request do
  describe "GET report" do
    let!(:merchants) do
      [create(:merchant),create(:merchant),create(:merchant),create(:merchant),create(:merchant)]
    end

    before do
      merchants.each do |merchant|
        create(:disbursement, merchant_id: merchant.id, week_of_year: 14, year: 2018)
      end
    end

    context 'when no merchant id is given' do
      it "JSON body response contains expected recipe attributes" do
        get disbursements_path, :params => {week: 14,year:2018}, :headers => { "Content-Type": "application/json" }
        parsed_response = JSON.parse(response.body)['value']
        expect(parsed_response.length).to eq(5)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when merchant id is given' do
      let(:merchant) { merchants.sample}
      it "JSON body response contains expected recipe attributes" do
        get disbursements_path, :params => {week: 14,year:2018, merchant_id: merchant.id}, :headers => { "Content-Type": "application/json" }
        parsed_response = JSON.parse(response.body)['value']
        expect(parsed_response['id']).to eq(merchant.id)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
