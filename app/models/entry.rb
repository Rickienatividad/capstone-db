class Entry < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_one :lure
end
