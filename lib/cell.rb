class Cell
  attr_accessor :content, :address

  Empty = ' '

  def initialize(content = Empty, address = nil)
    @content = content
    @address = address
  end

  def to_s
    @content
  end

  def inspect
    "#{@content} (#{@address})"
  end
end
