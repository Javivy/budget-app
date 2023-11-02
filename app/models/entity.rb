class Entity < ApplicationRecord
  belongs_to :group
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :group_id, presence: true
end
