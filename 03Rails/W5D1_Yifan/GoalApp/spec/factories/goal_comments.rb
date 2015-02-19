FactoryGirl.define do
  factory :goal_comment do
    body {Faker::Lorem.sentence}
  end

end
