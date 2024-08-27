# frozen_string_literal: true

class Annoucement < ApplicationRecord
  belongs_to :user
  belongs_to :company

  acts_as_tenant(:company)

  has_and_belongs_to_many :departments
  has_rich_text :content

  validates :user, presence: true
  validates :company, presence: true
  validates :title, presence: true, length: { in: 3..50 }
end
