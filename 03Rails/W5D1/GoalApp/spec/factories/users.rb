FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    password "password"
  end

end
