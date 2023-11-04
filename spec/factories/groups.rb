FactoryBot.define do
  factory :group do
    association :user
    name { 'Food' }
    icon { 'food.svg' }
  end
end