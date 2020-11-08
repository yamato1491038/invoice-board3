FactoryBot.define do
  factory :regular do
    
    dating                    {Faker::Date.in_date_period}
    hno                       {Faker::Number.leading_zero_number(digits: 4)}
    association :user
  end
end