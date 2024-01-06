class Search < ApplicationRecord
  belongs_to :user

  after_commit :broadcast_top_searches

  scope :top_searches, -> { select("query, COUNT(*) as count").group(:query).order(Arel.sql('COUNT(*) DESC')).limit(10) } # query to get most repeated searches from different users


  private

  def broadcast_top_searches
    Turbo::StreamsChannel.broadcast_update_to 'top_searches',
      target: 'top_searches',
      partial: 'searches/search',
      locals: { searches: self.class.top_searches }
  end
end
