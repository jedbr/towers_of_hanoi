require_relative 'hanoi/peg.rb'
require_relative 'hanoi/disk.rb'

class Hanoi
  include Math
  attr_reader :pegs, :disks, :moves

  def initialize(disks, pegs)
    @pegs = []
    @disks = []
    @moves = 0
    pegs.times { @pegs << Peg.new }
    disks.times do |i|
      disk = Disk.new(disks - i, @pegs.first)
      @pegs.first << disk
      @disks << disk
    end
  end

  def solve
    k = @disks.size - sqrt(2 * @disks.size + 1).round + 1
    hanoi(k, @pegs[0], @pegs[1], @pegs[2])
    hanoi(@disks.size - k, @pegs[0], @pegs[1], @pegs[3])
    hanoi(k, @pegs[2], @pegs[1], @pegs[3])
  end

  def hanoi(k, a, b, c)
    if k > 0
      hanoi(k - 1, a, c, b)
      c << a.shift
      @moves += 1
      hanoi(k - 1, b, a, c)
    end
  end

  def solve3
    k = @disks.size
    hanoi3(k, @pegs[0], @pegs[1], @pegs[2])
  end

  def hanoi3(k, a, b, c)
    if k > 0
      hanoi3(k - 1, a, c, b)
      c << a.shift
      @moves += 1
      hanoi3(k - 1, b, a, c)
    end
  end
end
