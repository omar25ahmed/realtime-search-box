class Article < ApplicationRecord
  scope :by_title, -> (search) { where("title LIKE ?", "%#{search}%") }
end
