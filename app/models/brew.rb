class Brew < ApplicationRecord
  has_many :purchases

  validates :blend_name, uniqueness: true
  def self.strongest
    max_strength = Brew.all.max_by {|brew| brew.strength}.strength
    strongest_brews = Brew.all.select {|brew| brew.strength == max_strength}
    strongest_brews
  end
end
