# frozen_string_literal: true

class User < ApplicationRecord
  include ActionText::Attachable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  belongs_to :department

  acts_as_tenant(:company)

  has_one_attached :avatar

  has_many :doc_and_files
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :annoucements, dependent: :destroy
  has_many :to_do_lists, class_name: 'ToDoList', foreign_key: 'creator_id', dependent: :destroy
  has_many :cards, class_name: 'Card', foreign_key: 'creator_id', dependent: :destroy

  has_and_belongs_to_many :assigned_to_do_lists, class_name: 'ToDoList', dependent: :destroy
  has_and_belongs_to_many :assigned_boards, class_name: 'Board', dependent: :destroy
  has_and_belongs_to_many :assigned_cards, class_name: 'Card', dependent: :destroy
  has_and_belongs_to_many :assigned_steps, class_name: 'Step', dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :company, presence: true
  validates :department, presence: true
  validates :avatar,
            content_type: %i[png jpg jpeg],
            size: { less_than: 2.megabytes, message: 'Image size is too large' }

  enum role: { user: 0, admin: 1 }

  def avatar_icon
    avatar.variant(resize_to_limit: [200, 200]).processed
  end

    def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(avatar, only_path: true) if avatar.attached?
  end

end
