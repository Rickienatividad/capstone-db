class Lure < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  has_many :fish
end
