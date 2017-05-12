class Hanoi
  class Peg
    attr_accessor :disks

    def initialize
      @disks = []
    end

    def <<(disk)
      @disks << disk
    end
  end
end
