class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy reorder_cards ]
  before_action :set_board, except: %i[reorder_cards]
  # GET /lists or /lists.json
  def index
    @lists = List.all
  end
  
  def reorder_cards
    card = @list.cards.find(params[:card_id])
    card.update(list_id: params[:new_list_id])
    card.insert_at(params[:position].to_i)
    head :ok
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    @list.color = random_color
    
    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@board), notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        flash.now[:alert] = @list.errors.full_messages.join(',')
        format.html { render "boards/show", locals: { board: @board }, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to list_url(@list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title, :position).merge(board_id: @board.id)
    end
end
