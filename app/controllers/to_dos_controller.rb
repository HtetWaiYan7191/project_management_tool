# frozen_string_literal: true

class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[show edit update update_status destroy]

  # GET /to_dos or /to_dos.json
  def index
    @to_dos = ToDo.includes(:to_do_lists).order(created_at: :desc).page(params[:page]).per(6)
    @next_page = @to_dos.next_page
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  # GET /to_dos/1 or /to_dos/1.json
  def show
    @to_do_lists = @to_do.to_do_lists.order(created_at: :desc).limit(5)
  end

  # GET /to_dos/new
  def new
    @to_do = ToDo.new
    @to_do.to_do_lists.build # This initializes a new to_do_list for the form
  end

  # GET /to_dos/1/edit
  def edit; end

  # POST /to_dos or /to_dos.json
  def create
    @to_do = ToDo.new(to_do_params)

    respond_to do |format|
      if @to_do.save
        format.html { redirect_to to_do_url(@to_do), notice: 'To do was successfully created.' }
        format.json { render :show, status: :created, location: @to_do }
      else
        flash.now[:alert] = @to_do.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1 or /to_dos/1.json
  def update
    respond_to do |format|
      if @to_do.update(to_do_params)
        format.html { redirect_to to_do_url(@to_do), notice: 'To do was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    return unless @to_do.update(to_do_params)

    respond_to(&:turbo_stream)
  end

  # DELETE /to_dos/1 or /to_dos/1.json
  def destroy
    authorize! :destroy, @to_do
    @to_do.destroy!

    respond_to do |format|
      format.html { redirect_to to_dos_url, notice: 'To do was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_to_do
    @to_do = ToDo.includes(:to_do_lists).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def to_do_params
    params.require(:to_do).permit(:name, :status, :company_id)
  end
end
