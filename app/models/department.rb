class Department < ApplicationRecord
  belongs_to :company

  has_and_belongs_to_many :annoucements 
  
  validates :name, presence: true
  validates :company, presence: true
end
