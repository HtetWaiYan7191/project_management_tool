class Message < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :parent_message, class_name: 'Message', optional: true

  validates :user, presence: true
  validates :department, presence: true
  validates :content, presence: true
end
