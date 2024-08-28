# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[edit show update destroy]
  load_and_authorize_resource

  def index
    @comments = @commentable.comments
  end

  def edit; end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully updated.'
    else
      render :new
    end
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @commentable, notice: 'Comment was successfully deleted.'
    else
      render :new
    end
  end

  private

  # This method determines the commentable type (Announcement or DocAndFile)
  def set_commentable
    @commentable = if params[:annoucement_id]
                     Annoucement.includes(:comments).find(params[:annoucement_id])
                   elsif params[:doc_and_file_id]
                     DocAndFile.includes(:comments).find(params[:doc_and_file_id])
                   end
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
