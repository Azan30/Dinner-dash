# frozen_string_literal: true

class OrdersController < ApplicationController
  include Status

  def index
    @orders = policy_scope(Order)
    if user_signed_in?
      @statuses = orders_statuses
      @orders = if params[:status].nil? || params[:status] == 'All'
                  @orders.page(params[:page]).per(3)
                else
                  @orders.where(status: params[:status]).page(params[:page]).per(3)
                end
    end
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    bill = 0
    quantity = 0
    @cart = Cart.find(params[:cart_id].to_i)
    @cart.cart_items.each do |cart_item|
      quantity = cart_item.quantity || 1
      sum = cart_item.item.price * quantity
      bill += sum
    end

    ActiveRecord::Base.transaction do
      @order = current_user.orders.create!(status: 'Pending', bill: bill)

      @cart.cart_items.each do |cart_item|
        LineItem.create!(order: @order, item: cart_item.item, quantity: quantity)
      end

      current_user.cart.cart_items.destroy_all

      redirect_to @order
    end
  end

  def edit
    ActiveRecord::Base.transaction do
      @statuses = orders_statuses
      @statuses.delete('All')
      @order = Order.find(params[:id])
      authorize @order
    end
  end

  def create
    @order = Order.new(order_params)
    authorize @order

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    authorize @order

    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order

    @order.destroy
    flash[:notice] = 'You have successfully Deleted.'
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :bill)
  end
end
