class Ramp < ApplicationRecord
  def self.create_from_collection(ramp_info)
    ramp_info.each do |ramp|
      Ramp.create(ramp)
    end
  end
end
