class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  validates :title, presence: true

  def self.by_title
    order(:title)
  end

  def self.by_priority
    order(:priority)
  end
end
