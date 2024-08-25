# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true

  has_many :departments
  has_many :annoucements
  has_many :users
  has_many :doc_and_files
end
