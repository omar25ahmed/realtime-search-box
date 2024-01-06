class SearchesController < ApplicationController
  def index
    @top_searches = Search.top_searches
  end

  def user_history
    @searches = current_user.searches.order(updated_at: :desc)
  end
end
