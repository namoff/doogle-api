FactoryBot.define do
  factory :word do
    word_name { Faker::Lorem.word }
    word_class { Faker::Lorem.word }
  end
end
