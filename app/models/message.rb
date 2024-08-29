# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :parent_message, class_name: 'Message', optional: true

  has_one_attached :picture
  has_one_attached :file 
  
  validates :user, presence: true
  validates :department, presence: true
  validates :content, presence: true

  broadcasts_to ->(message) { "#{message.department.id}_messages" }, inserts_by: :prepend

end
 