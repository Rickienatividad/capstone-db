class Entry < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_one :lure

  validates :date, presence: true
  validates :weather, presence: true
  validates :location, presence: true
end
