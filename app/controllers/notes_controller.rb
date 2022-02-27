class NotesController < ApplicationController
  def index
    render json: Note.all.where(user_id: current_user.id).order("created_at DESC")
  end

  def create

  end


  def update
  end


  def delete
  end

end
