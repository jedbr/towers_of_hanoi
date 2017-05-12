class Hanoi
  class Disk; end
  class Peg
    attr_accessor :disks

    def initialize
      @disks = []
    end

    def <<(disk)
      @disks << disk
    end
  end

  attr_reader :pegs

  def initialize(disks, pegs)
    @pegs = []
    pegs.times { @pegs << Peg.new }
    disks.times { @pegs.first << Disk.new }
  end

  def solve

  end
end
