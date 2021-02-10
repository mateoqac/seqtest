FactoryBot.define do
  factory :disbursement do
    amount { Faker::Commerce.price }
    earnings { Faker::Commerce.price }
    week_of_year { rand(52)}
    year {(2018..2020).to_a.sample}
    merchant
  end
end
