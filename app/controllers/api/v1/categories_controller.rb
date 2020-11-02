# frozen_string_literal: true

module Api::V1
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
      render json: @categories
    end

    def show
      @category = Category.find(params[:id])
      render json: @category
    end

    def new
      @category = Category.new
    end

    def edit
      @category = Category.find(params[:id])
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        render json: @category, status: :created
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def update
      @category = Category.find(params[:id])

      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @category = Category.find(params[:id])

      if @category.destroy
        head :no_content, status: :ok
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
