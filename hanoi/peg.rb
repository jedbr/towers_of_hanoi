class Hanoi
  class Peg
    attr_reader :disks, :id

    def initialize(id)
      @id = id
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

    def first
      @disks.first
    end
  end
end
