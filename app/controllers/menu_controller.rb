class MenuController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def edit
    @menu = Menu.find(params[:id]) rescue nil
  end

  def update
    @menu = Menu.find(params[:id]) rescue nil
    if @menu.update(update_params)
      redirect_to :root_path
    end
  end

  private

  def update_params
    params.permit(:title, :description, :image, :price)
  end
end
