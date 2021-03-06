class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


  def self.first_five
    Boat.first(5)
  end

  def self.dinghy
    Boat.where("length <?", 20)
  end

  def self.ship
    Boat.where("length >=?", 20)
  end

  def self.last_three_alphabetically
    Boat.order(:name).last(3)
  end

  def self.without_a_captain
    Boat.where("captain_id is null")
  end

  def self.without_a_captain
    Boat.where("captain_id is null")
  end

  def self.sailboats
    Boat.includes(:classifications).where(classifications: { name: 'Sailboat' })
  end

  def self.with_three_classifications
    boats = Boat.includes(:classifications)
    boats.select {|boat| boat.classifications.count >= 3 }
  end


end
