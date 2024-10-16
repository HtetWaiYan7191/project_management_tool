# frozen_string_literal: true

class Department < ApplicationRecord
  belongs_to :company

  acts_as_tenant(:company)

  has_and_belongs_to_many :annoucements
  has_many :messages
  has_many :users
  has_many :doc_and_files

  validates :name, presence: true
  validates :company, presence: true
end
