class ArticlesController < ApplicationController
  def index
    @articles = articles_based_on_search
  end

  private

  def articles_based_on_search
    if params[:search].present?
      SearchQueryValidatorService.new(current_user, params[:search]).generate
      Article.by_title(params[:search])
    else
      Article.all
    end
  end
end
