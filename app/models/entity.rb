class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :group_id, presence: true
end
