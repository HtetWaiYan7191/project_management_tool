# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CommonConcern
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_tenant, unless: :devise_controller?

  helper_method :current_department # Add this line

  # before_action :configure_permitted_parameters, if: :devise_controller?

  def set_tenant
    set_current_tenant(current_user.company)
  end

  def current_department
    current_user&.department
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, alert: exception.message
  end
end
