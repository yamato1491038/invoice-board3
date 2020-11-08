FactoryBot.define do
  factory :cost do
    
    dating                    {Faker::Date.in_date_period}
    hno                       {Faker::Number.leading_zero_number(digits: 4)}
    parking                   {Faker::Number.leading_zero_number(digits: 4)}
    fee                       {Faker::Number.leading_zero_number(digits: 4)}
    content                   {"説明文"}
    association :user
  end
end