class Task < ApplicationRecord
  belongs_to :List
  validates :body, presence: true

  def self.by_body
    order(:body)
  end

  def self.by_priority
    order(:priority)
  end
end
