# frozen_string_literal: true

class ToDoList < ApplicationRecord
  belongs_to :to_do
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_and_belongs_to_many :assigned_users, class_name: 'User', dependent: :destroy

  validates :to_do, presence: true
  validates :creator, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    return unless due_date.present? && due_date < Date.today

    errors.add(:due_date, "can't be in the past")
  end
end
