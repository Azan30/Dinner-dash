# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    if params[:category_id].nil?
      @items = Item.all
    else
      category = Category.find(params[:category_id])
      @items = category.items
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = 'You have successfully Deleted.'
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, category_ids: [])
  end
end