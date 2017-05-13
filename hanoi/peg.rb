class Hanoi
  class Peg
    attr_accessor :disks

    def initialize
      @disks = []
    end

    def <<(disk)
      @disks.unshift(disk)
    end

    def shift
      @disks.shift
    end

    def size
      @disks.size
    end
  end
end
