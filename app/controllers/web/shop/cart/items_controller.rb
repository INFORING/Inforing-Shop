class Web::Shop::Cart::ItemsController < Web::Shop::ApplicationController
  skip_authentication

  def create
    create_cart
    current_cart.add(params[:id])
    redirect_to categories_path unless redirect_to :back
  end

  def update
    current_cart.item_count(params[:id], params[:count])
    redirect_to categories_path unless redirect_to :back
  end

  def destroy
    if current_cart.items.count > 1
      current_cart.remove(params[:id])
    else
      destroy_current_cart
    end
    redirect_to categories_path unless redirect_to :back
  end

end