class NotesController < ApplicationController
  def index
    render json: Note.all
  end

  def create
  end


  def update
  end


  def delete
  end

end
