class PagesController < ApplicationController
  skip before_action :authenticate_user!, only: :home

  def home
  end
end
