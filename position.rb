class Position
  attr_accessor :occupied, :fired_upon

  def initialize
    @occupied = false
    @fired_upon = false
  end
end
