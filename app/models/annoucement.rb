# frozen_string_literal: true

class Annoucement < ApplicationRecord
  belongs_to :user
  belongs_to :company

  acts_as_tenant(:company)

  has_and_belongs_to_many :departments
  has_rich_text :content

  has_many :comments, as: :commentable, dependent: :destroy

  validates :user, presence: true
  validates :company, presence: true
  validates :title, presence: true, length: { in: 3..50 }

  enum status: { drafted: 0, published: 1 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[status]
  end
end
