class UsersController < ApplicationController
  def index
    if params[:query].present? 
      @users = User.where('full_name ILIKE ?', "%#{params[:query]}%")
    else 
      @users = User.none 
    end
    respond_to do |format|
      format.json {render json: @users}
    end
  end
end
