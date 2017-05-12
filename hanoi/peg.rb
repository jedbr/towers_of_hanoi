class Hanoi
  class Peg
    attr_accessor :disks

    def initialize
      @disks = []
    end

    def <<(disk)
      @disks.unshift(disk)
    end
  end
end
