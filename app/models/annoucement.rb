class Annoucement < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_and_belongs_to_many :departments 
  has_action_text :content

  validates :user, presence: true
  validates :company, presence: true
  validates :title, presence: true, length: { in: 3..50 }
end
