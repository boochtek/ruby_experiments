module SaferFloats

  class Error < StandardError

    def message
      "Don't try to compare floating points for equality!"
    end

  end

end


class Float

  def ==(other)
    fail SaferFloats::Error if other.is_a?(Float)
    super
  end

  def !=(other)
    fail SaferFloats::Error if other.is_a?(Float)
    super
  end

end
