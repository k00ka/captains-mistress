class Automaton < Player
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def initialize(name = nil)
    @name = name || self.class.name
  end

  def move
    raise NotImplementedError
  end
end

# load all automatons
Dir['./lib/automatons/*.rb'].each { |f| require f }
