# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome, :landing]
  skip_before_action :set_tenant, only: [:landing, :welcome]
  def landing; end

  def welcome; end

  def home; end 
end
