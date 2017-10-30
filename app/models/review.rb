class Review < ApplicationRecord
  belongs_to :product

  validates :comment, presence: true

  def format_create_date
    formatted_date = created_at.strftime("%Y-%m-%d, %-I:%Mpm, %Z")
  end

  def self.order_by_newest
    Review.order(created_at: :desc)
  end
end
