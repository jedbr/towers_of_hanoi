class Hanoi
  class Disk
    attr_accessor :peg

    def initialize(peg)
      @peg = peg
    end
  end

  class Peg
    attr_accessor :disks

    def initialize
      @disks = []
    end

    def <<(disk)
      @disks << disk
    end
  end

  attr_reader :pegs, :disks

  def initialize(disks, pegs)
    @pegs = []
    @disks = []
    pegs.times { @pegs << Peg.new }
    disks.times do
      disk = Disk.new(@pegs.first)
      @pegs.first << disk
      @disks << disk
    end
  end

  def solve(k = 2)

  end
end
