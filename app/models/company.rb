# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :departments
  has_many :annoucements
  has_many :users
  has_many :doc_and_files
  has_many :to_dos
  has_many :boards
  has_many :events
end
