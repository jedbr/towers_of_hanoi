class Hanoi
  class Disk
    attr_accessor :peg, :size

    def initialize(size, peg)
      @size = size
      @peg = peg
    end
  end
end
