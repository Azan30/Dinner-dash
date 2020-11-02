# frozen_string_literal: true

module Api::V1
  class ItemsController < ApplicationController
    def index
      @items = Item.all
      render json: @items
    end

    def show
      @item = Item.find(params[:id])
      render json: @item
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
        render json: @item
      else
        render 'new'
      end
    end

    def update
      @item = Item.find(params[:id])
      authorize @item

      if @item.update(item_params)
        render json: @item
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
end
