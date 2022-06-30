class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  
  def show
    @product_count = Product.all.count
    @category_count = Category.all.count
  end
end
