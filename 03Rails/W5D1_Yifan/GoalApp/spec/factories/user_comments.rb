FactoryGirl.define do
  factory :user_comment do
    body {Faker::Lorem.sentence}
    
  end

end
