require 'rails_helper'

RSpec.describe AmountDisbursedAfterFee, :model do
  let(:subject) { described_class.new(value) }

  describe '#perform' do

    context 'when value is less than 50' do
      let(:value) { 30 }
      let(:result) { 29.70 }

      it 'should substract 1%' do
        expect(subject.perform).to eq(result)
      end
    end

    context 'when value is in between 50 and 300' do
      let(:value) { 100 }
      let(:result) { 99.05 }

      it 'should substract 0.95%' do
        expect(subject.perform).to eq(result)
      end
    end

    context 'when value is greater than 300' do
      let(:value) { 400 }
      let(:result) { 396.60}

      it 'should substract 0.85%' do
        expect(subject.perform).to eq(result)
      end
    end
  end
end
