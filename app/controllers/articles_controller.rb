# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.by_title(params[:search])
    # Initiate a background job using ProcessSearchJob to handle the search process asynchronously,
    # optimizing scalability by efficiently managing thousands of requests without impacting application performance.
    ProcessSearchJob.perform_async(current_user.id, params[:search]) if params[:search]
  end
end
