class BasketsController < ApplicationController
  def new
    @basket = Basket.new
  end
end
