class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.map do |item|
      { category: item, product_count: Product.where(category_id: item.id).count }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
