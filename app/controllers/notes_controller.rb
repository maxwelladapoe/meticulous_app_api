class NotesController < ApplicationController
  respond_to :json

  def index
    render json: Note.all.where(user_id: current_user.id).order("created_at DESC")
  end

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    if note.save
      render json: {note:note}, status: :created
    else
      render json: {errors: note.errors}, status: :unprocessable_entity
    end
  end


  def update
    note = Note.find(params[:id]);

    if note
      #check note owner
      if note.user_id == current_user.id
        
        if note.update(note_params)
          render json: {note:note}, status: :ok
        else
          render json: {errors: note.errors}, status: :unprocessable_entity
        end

       
      else
        render json: {
          message: 'Resource does not belong to this user'
        }, status: :unauthorized
      end

    end
  end


  def destroy
    note = Note.find(params[:id]);
    if note
          #check note owner
          if note.user_id == current_user.id

            if note.delete
              render json: {
                message: 'Note has been deleted'
              }, status: :ok

            else
              render json: {errors: note.errors}, status: :unprocessable_entity
            end

          else
            render json: {
              message: 'Resource does not belong to this user'
            }, status: :unauthorized
          end
   
    end
  end

  private

    def note_params
      params.require(:note).permit(:title,:content,:note_type,:color,:clipped)
    end

end
