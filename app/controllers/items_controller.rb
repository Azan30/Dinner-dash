# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    if params[:category_id].nil?
      @items = Item.all.page(params[:page]).per(3)
    else
      category = Category.find(params[:category_id])
      @items = category.items.page(params[:page]).per(3)
    end
    authorize @items
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    authorize @item

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item

    if @item.destroy
      flash[:notice] = 'You have successfully Deleted.'
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :availability, :image, category_ids: [])
  end
end
