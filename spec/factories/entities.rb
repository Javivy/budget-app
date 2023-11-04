FactoryBot.define do
  factory :entity do
    name { 'Food' }
    amount { 100 }
    association :group, factory: :group
  end
end