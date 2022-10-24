class Writing < ApplicationRecord
  validates :title, presence: true
  validates :logline, presence: true

  attr_accessor :remove_w_file
  
  after_save :purge_w_file, if: :remove_w_file
  private def purge_w_file
    w_file.purge_later
  end

  has_one_attached :w_file
end
