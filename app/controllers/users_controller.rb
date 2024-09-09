# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = if params[:query].present?
               User.where('full_name ILIKE ?', "%#{params[:query]}%")
             else
               User.none
             end
    respond_to(&:json)
  end
end
