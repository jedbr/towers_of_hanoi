require_relative 'hanoi/peg.rb'

class Hanoi
  include Math
  attr_reader :pegs, :moves

  Disk = Struct.new(:size)

  def initialize(disks, pegs)
    @pegs = []
    @disks = disks
    @moves = 0
    pegs.times { |i| @pegs << Peg.new(i + 1) }
    disks.times do |i|
      disk = Disk.new(disks - i)
      @pegs.first << disk
    end
  end

  def print_report(move)
    return unless @verbose
    puts '----------------------------'
    puts "Move: #{@moves}"
    puts "Disk #{move[:item]} moved from peg #{move[:from]} to peg #{move[:to]}"
    print_current_state
  end

  def print_current_state
    @pegs.each do |p|
      print "Peg #{p.id} | "
      disks = p.disks.map(&:size)
      puts "Disks: #{disks}"
    end
  end

  # Frame-Stewart algorithm for 4 pegs

  def solve(verbose = false)
    @verbose = verbose
    k = @disks - sqrt(2 * @disks + 1).round + 1
    hanoi(k, @pegs[0], @pegs[1], @pegs[2])
    hanoi(@disks - k, @pegs[0], @pegs[1], @pegs[3])
    hanoi(k, @pegs[2], @pegs[1], @pegs[3])
  end

  def hanoi(k, a, b, c)
    if k > 0
      hanoi(k - 1, a, c, b)
      c << a.shift
      @moves += 1
      print_report(from: a.id, to: c.id, item: c.first.size)
      hanoi(k - 1, b, a, c)
    end
  end

  # Classic algorithm for 3 pegs

  def solve3(verbose = false)
    @verbose = verbose
    k = @disks
    hanoi3(k, @pegs[0], @pegs[1], @pegs[2])
  end

  def hanoi3(k, a, b, c)
    if k > 0
      hanoi3(k - 1, a, c, b)
      c << a.shift
      @moves += 1
      print_report(from: a.id, to: c.id, item: c.first.size)
      hanoi3(k - 1, b, a, c)
    end
  end
end
