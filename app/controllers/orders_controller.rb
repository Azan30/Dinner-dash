class OrdersController < ApplicationController
  def index
    if params[:status] == 'All'
      @orders = Order.all
    else
      @orders = Order.where(status: params[:status])
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
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
