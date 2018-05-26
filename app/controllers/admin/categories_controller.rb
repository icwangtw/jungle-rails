class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => Rails.configuration.admin[:adminu], :password => Rails.configuration.admin[:adminp]

  def index
    @categories = Category.order(id: :asc).all
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
      :name,
    )
  end

end
