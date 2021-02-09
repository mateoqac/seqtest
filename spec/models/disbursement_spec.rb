require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:earnings) }
  it { is_expected.to validate_presence_of(:week_of_year) }
  it { is_expected.to validate_presence_of(:year) }

  it { should belong_to(:merchant) }
end
