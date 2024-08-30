class ToDo < ApplicationRecord
  belongs_to :company

  has_many :to_do_lists, dependent: :destroy

  validates :company, presence: true
  validates :name, presence: true, length: { maximum: 20 }

end
