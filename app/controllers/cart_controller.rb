class CartController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  # skip_before_filter :verify_authenticity_token

  def create
    @cart_item = Cart.create({user_id: current_user.id, menu_id: params[:menu_id]})
    redirect_to :cart_path
    # redirect_to "cart/show"
  end

  def show
    @cart_items = Cart.where({user_id: current_user.id, checked_out: false})
  end

  def delete
    @cart_item = Cart.find(params[:id]) rescue nil
    @cart_item.delete
    redirect_to :cart_path
  end

  def checkout
    order = Order.create({user_id: current_user.id, address: params[:address], city: params[:city], country: params[:country], phone: params[:phone]})
    # order.save!

    if order.id.present?
      @cart_items = Cart.where({user_id: current_user.id, checked_out: false})
      @cart_items.update_all(order_id: order.id, checked_out: true)
    end
    # render json: {ok: "ok"}
    redirect_to controller: 'cart', action: 'show_order', id: order.id
  end

  def show_order
    @order = Order.find(params[:id]) rescue nil
    
  end
end
