# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :company
  acts_as_tenant(:company)

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :lists, -> { order(position: :asc) }, dependent: :destroy
  has_and_belongs_to_many :assigned_users, class_name: 'User', dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :creator, presence: true
  validates :company, presence: true
end
