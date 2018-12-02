#! /usr/bin/ruby

class Solution
  def initialize
    @input = []
    @frequencies = []
    @value = 0
    @cycles = 0
  end

  def run!
    while true
      get_input if @input.empty?
      i = @input.shift
      @value += i
      break if @frequencies.include?(@value)
      @frequencies << @value
    end
    puts @value
    puts "Cycles: #{@cycles}"
  end

  private
  
  def get_input
    File.open('input.txt', 'r') do |f|
      f.each_line do |line|
        @input << line.to_i
      end
    end
    @cycles += 1
  end
end

Solution.new.run!
