# frozen_string_literal: true

class PagesController < ApplicationController
  include PagesHelper
  skip_before_action :authenticate_user!, only: %i[welcome landing]
  skip_before_action :set_tenant, only: %i[landing welcome]
  def landing; end

  def welcome; end

  def home
    @annoucements = Annoucement.includes(:comments).all.order(updated_at: :desc).limit(4)
    @cards = cards
  end
end
