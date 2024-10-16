# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_rich_text :description

  has_and_belongs_to_many :assigned_users, class_name: 'User', dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :list, presence: true
end
