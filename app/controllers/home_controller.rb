class HomeController < ApplicationController

  def index
    @message = 'Welcome to the dashboard.'
    @menus = Menu.all
  end
end
