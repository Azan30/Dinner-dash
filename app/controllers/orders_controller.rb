# frozen_string_literal: true

class OrdersController < ApplicationController
  include Status

  def index
    @orders = policy_scope(Order)
    @statuses = orders_statuses
    @orders = if params[:status].nil? || params[:status] == 'All'
                @orders
              else
                @orders.where(status: params[:status])
              end
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    bill = 0
    @cart = Cart.find(params[:cart_id].to_i)
    @cart.cart_items.each do |cart_item|
      bill = cart_item.item.price
      bill += bill
    end

    @order = current_user.orders.create!(status: 'Pending', bill: bill)

    @cart.cart_items.each do |cart_item|
      LineItem.create!(order: @order,item: cart_item.item)
    end

    current_user.cart.cart_items.destroy_all

    redirect_to @cart
  end

  def edit
    @statuses = orders_statuses
    @order = Order.find(params[:id])
    authorize @order
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
    byebug
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
