# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  belongs_to :department

  acts_as_tenant(:company)

  has_many :doc_and_files
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :company, presence: true
  validates :department, presence: true

  enum role: { user: 0, admin: 1 }
end
