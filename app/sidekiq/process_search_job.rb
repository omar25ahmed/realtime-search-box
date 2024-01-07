class ProcessSearchJob
  include Sidekiq::Job

  def perform(user_id, search)
    user = User.find(user_id)
    SearchQueryValidatorService.new(user, search).execute # service to manage validation and storage of user search queries, preventing redundancy and ensuring data integrity.
  end
end
