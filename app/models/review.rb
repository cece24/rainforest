class Review < ApplicationRecord
  belongs_to :product

  validates :comment, presence: true

  def format_create_date
    formatted_date = created_at.strftime("%Y-%m-%d, %-I:%Mpm, %Z")
  end
end
