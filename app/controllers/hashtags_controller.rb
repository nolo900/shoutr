class HashtagsController < ApplicationController
  def show
    @search = SearchService.new(term:hashtag)
  end

  def hashtag
    "##{params[:id]}"
  end
end