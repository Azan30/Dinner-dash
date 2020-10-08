class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
    @categories = Category.all
  end
end
