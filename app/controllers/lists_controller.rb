class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_paramas)
    redirect_to lists_path
  end

  private

  def list_paramas
    params.require(:list).permit(:name)
  end
end

# voir toutes mes listes de films. (index)
# voir les détails d’une liste de films. (show)
# je peux créer une liste de films.(new, create)
# marquer (bookmark) un film dans une liste de films.(update)
# détruire un bookmark. (delete)
