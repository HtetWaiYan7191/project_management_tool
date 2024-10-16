# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: 'Comment', optional: true
  
  has_many :reply_comments, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true
  validates :commentable, presence: true
end
