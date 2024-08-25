# frozen_string_literal: true

class DocAndFile < ApplicationRecord
  belongs_to :company
  belongs_to :department

  has_many_attached :files

  validates :company, presence: true
  validates :department, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { in: 4..50 }
end
