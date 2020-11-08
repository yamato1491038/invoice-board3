FactoryBot.define do
  factory :persuation do
    
    dating                    {Faker::Date.in_date_period}
    hno                       {Faker::Number.leading_zero_number(digits: 4)}
    association :user
  end
end