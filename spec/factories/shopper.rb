FactoryBot.define do
  factory :shopper do
    name {Faker::Name.name }
    email {Faker::Internet.email}
    nif { Faker::DNI.nie}
  end
end
