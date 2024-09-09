# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]

  # GET /messages or /messages.json
  def index
    @messages = current_department.messages.includes(:user).order(created_at: :desc).page(page).per(20)
    @next_page = @messages.next_page
    @messages = @messages.reverse
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  # GET /messages/1 or /messages/1.json
  def show; end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit; end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        broadcast_message(@message)
        format.html { redirect_to message_url(@message), notice: 'Message was successfully created.' }
        format.turbo_stream
        format.json { render :show, status: :created, location: @message }
      else
        puts @message.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # broadcast message
  def broadcast_message(message)
    Turbo::StreamsChannel.broadcast_before_to(
      message.department,
      target: 'anchor',
      partial: 'messages/message',
      locals: { message: }
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  def page
    params.fetch(:page, 1).to_i
  end

  def messages_target
    params.fetch(:turbo_target, 'messages-list')
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content, :picture, :file).merge(user: current_user, department: current_department)
  end
end
