class Entry < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :lures
end
