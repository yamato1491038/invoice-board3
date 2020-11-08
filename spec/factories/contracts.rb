FactoryBot.define do
  factory :contract do
    
    name                      {Faker::Job.title}
    money                     {Faker::Number.leading_zero_number(digits: 5)}
    kind                      {Faker::Number.between(from: 1, to: 2)}
    active                    {Faker::Boolean.boolean}
  end
end