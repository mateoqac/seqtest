FactoryBot.define do
  factory :merchant do
    name {Faker::Name.name }
    email {Faker::Internet.email}
    cif { Faker::Company.spanish_organisation_number}
  end

  trait :with_episodes do
    after(:create) do |season, _|
      5.times do |i|
        create(:episode, season_id:season.id, episode_number: i+1)
      end
    end
  end
end
