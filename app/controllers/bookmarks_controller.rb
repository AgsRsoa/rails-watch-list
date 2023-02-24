class BookmarksController < ApplicationController
  def new
   @bookmark = Bookmark.new
   @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # récupérer ma liste
    @list = List.find(params[:list_id])
    # ajouter la liste au champ du bookmark
    @bookmark.list = @list
    # sauvegarder la liste
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
   @bookmark =  Bookmark.find(params[:id])
   @bookmark.destroy
   redirect_to list_path(@bookmark.list)
  end
  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
    # ici pas besoin de list_id car dans la vue on est déja dans une liste depuis laquelle on ajoute un bookmark
  end
end
