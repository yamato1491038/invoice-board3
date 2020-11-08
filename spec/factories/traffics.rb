FactoryBot.define do
  factory :traffic do
    
    dating                    {Faker::Date.in_date_period}
    hno                       {Faker::Number.leading_zero_number(digits: 4)}
    field                     {Faker::Address.city}
    distance                  {Faker::Number.leading_zero_number(digits: 3)}
    fee                       {Faker::Number.leading_zero_number(digits: 4)}
    content                   {"説明文"}
    association :user
  end
end