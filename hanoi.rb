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

  def print_start
    return unless @verbose
    puts '----------------------------'
    puts 'Start'
    print_current_state
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
      disks = p.disks.map(&:size).reverse
      puts "Disks: #{disks}"
    end
  end

  # Frame-Stewart algorithm for 4 pegs

  def solve(verbose = true)
    @verbose = verbose
    print_start
    hanoi4(@disks, @pegs[0], [@pegs[1], @pegs[2]], @pegs[3])
  end

  def hanoi4(number_of_disks, from, additional_pegs, to)
    k = number_of_disks - sqrt(2 * number_of_disks + 1).round + 1
    hanoi3(k, from, additional_pegs.first, additional_pegs.last)
    hanoi3(number_of_disks - k, from, additional_pegs.first, to)
    hanoi4(k, additional_pegs.last, [from, additional_pegs.first], to) unless k > 0
  end

  # Classic algorithm for 3 pegs

  def solve3(verbose = true)
    @verbose = verbose
    print_start
    k = @disks
    hanoi3(k, @pegs[0], @pegs[1], @pegs[2])
  end

  def hanoi3(k, from, additional_peg, to)
    return unless k > 0
    hanoi3(k - 1, from, to, additional_peg)
    to << from.shift
    @moves += 1
    print_report(from: from.id, to: to.id, item: to.first.size)
    hanoi3(k - 1, additional_peg, from, to)
  end
end
