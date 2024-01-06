class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    # Ensure accurate retrieval of the user's IP address, considering proxies or load balancers
    ip = if request.headers["X-Forwarded-For"].present?
          request.headers["X-Forwarded-For"].split(",").first.strip
        else
          request.remote_ip
        end
    current_user ||= User.find_or_create_by(ip_address: ip)
  end
end
