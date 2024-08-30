class ToDoList < ApplicationRecord
  belongs_to :to_do
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_and_belongs_to_many :assigned_users, class_name: 'User', dependent: :destroy

  validates :to_do, presence: true
  validates :creator, presence: true
  validates :name, presence: true, length: { maximum: 20 }

end
