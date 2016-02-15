class NotesController < ApplicationController
 before_action :authenticate_user!
 before_action :find_note, only:[:show, :edit, :update, :destroy]

def index

  if params[:category].blank?
    @notes = Note.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @notes = Note.where(category_id: @category_id).order("created_at DESC")
end
end

def show
end

def new
  @note = current_user.notes.build
end

def create
  @note = current_user.notes.build(note_params)
  if @note.save
    redirect_to @note
  else
    render 'new'

end
end

def edit

end
def update
 if @note.update(note_params)
   redirect_to @note

else
  render 'edit'
end
end

def destroy
  @note.destroy
  redirect_to root_path
end


private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :category_id)
  end


end
