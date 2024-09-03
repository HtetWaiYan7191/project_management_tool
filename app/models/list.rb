# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board

  has_many :cards, -> { order(position: :asc) }, dependent: :destroy

  acts_as_list scope: :board

  validates :board, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :position, numericality: { only_integer: true }
end
