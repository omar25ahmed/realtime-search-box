class User < ApplicationRecord
  has_many :searches, foreign_key: 'user_ip_address', primary_key: 'ip_address'
end
