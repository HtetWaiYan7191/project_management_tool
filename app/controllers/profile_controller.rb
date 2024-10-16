# frozen_string_literal: true

class ProfileController < ApplicationController
  def edit; end

  def update
    if current_user.update(profile_params)
      redirect_to profile_edit_path, notice: 'Profile updated successfully'
    else
      flash.now[:alert] = current_user.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:full_name, :email, :position, :role, :avatar)
  end
end
