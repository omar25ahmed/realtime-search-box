class SearchQueryValidatorService
  def initialize(user, query)
    @user = user
    @query = query
  end

  def generate
    last_search = fetch_last_search
    normalized_last_search = normalize_query(last_search&.query)
    normalized_current_query = normalize_query(@query)

    if valid_for_update?(normalized_last_search, normalized_current_query)
      last_search.update(query: @query)
    else
      @user.searches.create(query: @query)
    end
  end

  private

  def fetch_last_search
    @user.searches.order(updated_at: :desc).first
  end

  def normalize_query(query)
    query&.delete(' ')&.downcase
  end

  def valid_for_update?(last_search, current_query)
    last_search.present? && (current_query.include?(last_search) || last_search.include?(current_query))
  end
end