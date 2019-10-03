class PagesController < ApplicationController
  def home
    @products = Product.all
    @orders = Order.all
  end

  def menu
  end

  def event
  end
end
