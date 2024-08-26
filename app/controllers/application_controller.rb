# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_tenant, unless: :devise_controller? 

  # before_action :configure_permitted_parameters, if: :devise_controller?

  def set_tenant
    set_current_tenant(current_user.company)
  end
end
