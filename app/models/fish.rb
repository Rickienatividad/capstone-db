class Fish < ApplicationRecord
  belongs_to :entry
  belongs_to :lure
  belongs_to :user
end
