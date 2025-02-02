# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy reorder_lists]

  # GET /boards or /boards.json
  def index
    @boards = Board.all
    redirect_to board_path(Board.first) if @boards.count > 1
    nil
  end

  def reorder_lists
    list = List.find(params[:list_id])
    list.insert_at(params[:position].to_i)
    head :ok
  end

  # GET /boards/1 or /boards/1.json
  def show
    @board = Board.includes(:lists).find(params[:id])
    @boards = Board.all
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit; end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        flash[:notice] = 'Card was successfully created.'
        format.json { render json: { redirect_url: board_path(@board) }, status: :ok }
      else
        format.json { render json: @board.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy!

    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:title).merge(creator_id: current_user.id)
  end
end
