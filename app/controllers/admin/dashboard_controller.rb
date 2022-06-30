class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.count
    @category_count = Category.all.count
  end
end
