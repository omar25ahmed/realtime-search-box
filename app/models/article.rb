# frozen_string_literal: true

class Article < ApplicationRecord
  scope :by_title, ->(query) { where(arel_table[:title].matches("%#{query}%")).limit(10) }
end
