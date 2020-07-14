class BasketsController < ApplicationController
  before_action :find_basket, only: [:show]
  
  def new
    @basket = Basket.new
  end
  
  def show; end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end
end
