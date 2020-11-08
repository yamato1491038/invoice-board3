FactoryBot.define do
  factory :regular do
    
    dating                      {Faker::Date.in_date_period}
    hno                     {Faker::Internet.free_email}
    password                  {password}
    password_confirmation     {password}
  end
end