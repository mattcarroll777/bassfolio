class Writing < ApplicationRecord
  validates :title, presence: true
  validates :logline, presence: true
end
