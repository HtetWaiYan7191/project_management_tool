# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :company
  acts_as_tenant(:company)

  validates :title, presence: true, length: { maximum: 100 }
  validates :company, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
end
