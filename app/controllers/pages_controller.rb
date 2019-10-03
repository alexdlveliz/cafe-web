class PagesController < ApplicationController
  def home
    @products = Product.all
    @orders = Order.all
    @events = Event.all
  end

  def menu
  end

  def event
  end
end
