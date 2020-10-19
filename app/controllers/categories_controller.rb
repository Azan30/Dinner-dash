# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page]).per(3)
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    authorize @category

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category
    @category.destroy

    flash[:notice] = if @category.destroy
                       'You have successfully Deleted.'
                     else
                       'Category Not Deleted.'
                     end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
