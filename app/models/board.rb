class Board < ApplicationRecord
  has_many :lists
  validates :name, presence: true

  def self.by_name
    order(:name)
  end

  def self.by_priority
    order(:priority)
  end

  def self.by_color
  end
end
