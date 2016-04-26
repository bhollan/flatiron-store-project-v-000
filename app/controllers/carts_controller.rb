class CartsController < ApplicationController

  def checkout

    #I have no idea why my helper function isn't working here
    current_cart = current_user.current_cart
    current_cart.update(status: 1)
    current_cart.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end

    submitted_cart = current_cart
    current_user.current_cart = nil
    redirect_to cart_path(submitted_cart)
  end

  def show
    @cart = current_user.current_cart
  end
end
