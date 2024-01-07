class SearchQueryValidatorService
  def initialize(user, query)
    @user = user
    @query = query
  end

  def execute
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
    @user.searches.order(updated_at: :desc).first # Composite index added for user_id and updated_at to improve the performance
  end

  def normalize_query(query)
    query&.delete(' ')&.downcase
  end

  # Any checks will be written here to enhance our algorithm in response to new requirements or improvements
  def valid_for_update?(last_search, current_query)
    return false unless last_search.present?

    includes_current_query = current_query.include?(last_search)
    includes_last_search = last_search.include?(current_query)

    includes_current_query || includes_last_search
  end
end
