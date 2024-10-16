# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_list
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    user_ids = card_params[:assigned_user_ids].reject(&:blank?)
    @card.assigned_users = User.where(id: user_ids)

    respond_to do |format|
      if @card.save
        flash[:notice] = 'Card was successfully created.'
        format.json { render json: { redirect_url: board_path(@list.board) }, status: :ok }
      else
        format.json { render json: @card.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    if @card.update(card_params)
      flash[:notice] = 'Card was successfully updated.'
      respond_to do |format|
        format.json { render json: { redirect_url: board_path(@list.board) }, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: @card.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:title, :due_date, :description, :position, assigned_user_ids: []).merge(list: @list, creator_id: current_user.id)
  end
end
