# frozen_string_literal: true

class ToDoListsController < ApplicationController
  before_action :set_to_do
  before_action :set_to_do_list, only: %i[show edit update destroy hide_edit update_status]

  # GET /to_dos/:to_do_id/to_do_lists
  def index
    @to_do_lists = @to_do.to_do_lists
  end

  # GET /to_dos/:to_do_id/to_do_lists/:id
  def show; end

  # GET /to_dos/:to_do_id/to_do_lists/new
  def new
    @to_do_list = @to_do.to_do_lists.new
  end

  def hide_edit; end

  # GET /to_dos/:to_do_id/to_do_lists/:id/edit
  def edit
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  # POST /to_dos/:to_do_id/to_do_lists
  def create
    @to_do_list = @to_do.to_do_lists.new(to_do_list_params)

    user_ids = to_do_list_params[:assigned_user_ids].reject(&:blank?)
    @to_do_list.assigned_users = User.where(id: user_ids)

    if @to_do_list.save
      redirect_to to_do_path(@to_do), notice: 'ToDo List was successfully created.'
    else
      flash.now[:alert] = @to_do_list.errors.full_messages.join(',')
      render 'to_dos/show'
    end
  end

  # PATCH/PUT /to_dos/:to_do_id/to_do_lists/:id
  def update
    if @to_do_list.update(to_do_list_params)
      redirect_to to_do_path(@to_do), notice: 'ToDo List was successfully updated.'
    else
      flash.now[:alert] = @to_do_list.errors.full_messages.join(',')
      render 'to_dos/show'
    end
  end

  def update_status
    return unless @to_do_list.update(to_do_list_params)

    respond_to(&:turbo_stream)
  end

  # DELETE /to_dos/:to_do_id/to_do_lists/:id
  def destroy
    @to_do_list.destroy
    redirect_to to_do_to_do_lists_path(@to_do), notice: 'ToDo List was successfully destroyed.'
  end

  private

  # Set the parent ToDo for nested routes
  def set_to_do
    @to_do = ToDo.find(params[:to_do_id])
  end

  # Set the specific ToDoList for actions like show, edit, update, and destroy
  def set_to_do_list
    @to_do_list = @to_do.to_do_lists.find(params[:id])
  end

  # Strong parameters for ToDoList
  def to_do_list_params
    params.require(:to_do_list).permit(:name, :due_date, :note, :status, assigned_user_ids: []).merge(creator_id: current_user.id) # Add other parameters as needed
  end
end
