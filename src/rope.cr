class Rope
  VERSION = "0.0.0"

  getter! left : self
  getter! right : self
  getter! short : String
  getter weight : Int32

  protected setter left
  protected setter right

  def initialize(@short : String)
    @left = nil
    @right = nil
    @weight = short.bytesize
  end

  protected def initialize(@weight)
    @left = nil
    @right = nil
    @short = nil
  end

  def byte_at(index)
    return right.byte_at(index - weight) if weight < index && right?
    return left.byte_at(index) if left?
    short.byte_at(index)
  end

  def byte_at?(index)
    return right.byte_at(index - weight) if weight < index && right?
    return left.byte_at?(index) if left?
    short.byte_at?(index)
  end

  def +(other : self) : Rope
    root = Rope.new(bytesize)
    root.left = self
    root.right = other
    root
  end

  def +(other : String) : Rope
    root = Rope.new(bytesize)
    root.left = self
    root.right = Rope.new(other)
    root
  end

  def bytesize : Int32
    @short.try { |s| return s.bytesize }
    sum = 0
    @left.try { |l| sum += l.bytesize }
    @right.try { |r| sum += r.bytesize }
    return sum
  end

  def to_s(io : IO)
    if short?
      io << short
      return
    end
    left.try { |l| l.to_s(io) }
    right.try { |r| r.to_s(io) }
  end
end
