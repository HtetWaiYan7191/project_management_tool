# frozen_string_literal: true

class AnnoucementsController < ApplicationController
  before_action :set_annoucement, only: %i[show edit update destroy]

  # GET /annoucements or /annoucements.json
  def index
    @annoucements = Annoucement.all
  end

  # GET /annoucements/1 or /annoucements/1.json
  def show; end

  # GET /annoucements/new
  def new
    @annoucement = Annoucement.new
    respond_to do |format|
      format.turbo_stream
      format.html # fallback for regular requests
    end
  end

  # GET /annoucements/1/edit
  def edit
    
  end

  # POST /annoucements or /annoucements.json
  def create
    @annoucement = Annoucement.new(annoucement_params)
    if annoucement[:is_all_department] == true
      @annoucement.departments << Department.all
    else 
      @annoucement.departments << Department.where(id: annoucement[:department_ids])
    end

    respond_to do |format|
      if @annoucement.save
        format.html { redirect_to annoucement_url(@annoucement), notice: 'Annoucement was successfully created.' }
        format.turbo_stream
        format.json { render :show, status: :created, location: @annoucement }
      else
        flash.now[:alert] = @annoucement.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoucements/1 or /annoucements/1.json
  def update
    respond_to do |format|
      if @annoucement.update(annoucement_params)
        if annoucement_params[:is_all_department] == true
          @annoucement.departments = Department.all # Associate all departments if the flag is true
        else
          @annoucement.departments = Department.where(id: annoucement_params[:department_ids]) # Associate specific departments
        end
        format.html { redirect_to annoucement_url(@annoucement), notice: 'Annoucement was successfully updated.' }
        # format.turbo_stream
        format.json { render :show, status: :ok, location: @annoucement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoucements/1 or /annoucements/1.json
  def destroy
    @annoucement.destroy!

    respond_to do |format|
      format.html { redirect_to annoucements_url, notice: 'Annoucement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_annoucement
    @annoucement = Annoucement.includes(:comments).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def annoucement_params
    params.require(:annoucement).permit(:title, :company_id, :content, department_ids: []).tap do |whitelisted|
      whitelisted[:is_all_department] = ActiveModel::Type::Boolean.new.cast(params[:annoucement][:is_all_department])
      whitelisted[:user_id] = current_user.id
    end
  end
end
