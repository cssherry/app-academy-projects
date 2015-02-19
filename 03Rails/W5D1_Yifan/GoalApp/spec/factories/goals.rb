FactoryGirl.define do
  factory :goal do
    body {Faker::Lorem.sentence}
    status "public"
  end

end
