require_relative 'hanoi/peg.rb'
require_relative 'hanoi/disk.rb'

class Hanoi
  attr_reader :pegs, :disks

  def initialize(disks, pegs)
    @pegs = []
    @disks = []
    pegs.times { @pegs << Peg.new }
    disks.times do |i|
      disk = Disk.new(disks - i, @pegs.first)
      @pegs.first << disk
      @disks << disk
    end
  end

  def solve(k = 2)

  end
end
