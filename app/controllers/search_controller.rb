class SearchController < ApplicationController
  def index
    @query = params[:query]
    @products = Product.where("title LIKE ?", "%#{@query}%")
  end
end
