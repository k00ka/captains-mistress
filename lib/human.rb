class Human < Player
  def initialize(name = nil)
    @name = name
  end

  def move
    gets.chomp.to_i
  end
end
