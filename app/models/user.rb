class User < ApplicationRecord
  has_many :groups
  has_many :entities, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, if: :will_save_change_to_email?
end
