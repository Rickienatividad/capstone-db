class Knot < ApplicationRecord
  def self.create_from_collection(knot_list)
    knot_list.each do |knot|
      Knot.create(knot)
    end
  end
end
