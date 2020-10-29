class UserItemsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @buy = Buy.new
  end

  def create
   
  end

  private

  
end
