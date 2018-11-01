class SearchesController < ApplicationController
  def show
    @search = SearchService.new(term: search_term)
  end

  def search_term
    params[:search][:term]
  end
end