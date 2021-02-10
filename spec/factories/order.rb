FactoryBot.define do
  factory :order do
    amount { Faker::Commerce.price }
    merchant
    shopper
  end

  trait :complated do
    transient do
      complated_at { Time.current}
    end
  end
end
