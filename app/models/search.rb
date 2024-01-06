class Search < ApplicationRecord
  belongs_to :user, foreign_key: 'user_ip_address', primary_key: 'ip_address'
end
