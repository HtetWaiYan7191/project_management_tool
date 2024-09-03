# frozen_string_literal: true

class Step < ApplicationRecord
  belongs_to :card

  has_and_belongs_to_many :assigned_users, class_name: 'User', dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
end
