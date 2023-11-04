FactoryBot.define do
  factory :user do
    name { Faker::Name.name } # Use the Faker gem to generate a unique email
    email { Faker::Internet.unique.email } # Use the Faker gem to generate a unique email
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Time.now } # This confirms the user's email immediately

    # If you need unconfirmed users in some tests, you can use a trait:
    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
