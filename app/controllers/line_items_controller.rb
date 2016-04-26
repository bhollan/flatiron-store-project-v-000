class LineItemsController < ApplicationController

  def create
    if !current_user
      redirect_to new_user_session_path
    else
      current_cart = current_user.current_cart
      current_cart ||= Cart.create(user_id:current_user.id)
      line_item = current_cart.add_item(params[:item_id])
      line_item.save
      redirect_to cart_path(current_cart)
   end

  end
end
