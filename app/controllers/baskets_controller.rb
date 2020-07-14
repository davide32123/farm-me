class BasketsController < ApplicationController
  before_action :find_basket, only: [:show]

  def show; end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end
end
