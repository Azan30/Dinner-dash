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
  end

  def new
    @order = Order.new
  end

  def edit
    @statuses = orders_statuses
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = 'You have successfully Deleted.'
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :bill)
  end
end
