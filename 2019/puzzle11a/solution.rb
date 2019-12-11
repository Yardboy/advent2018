#!/usr/local/bin/ruby
require '../solution2019'
require '../intcode'

class Solution < Solution2019
  TURNS = { u: %i[l r], r: %i[u d], d: %i[r l], l: %i[d u] }.freeze

  private

  def process_input
    initial_setup
    until computer.done?
      new_color, direction = run_computer(current_color)[-2..-1]
      paint!(new_color)
      turn!(direction)
      move!(1)
    end
    @answer = @panels.size
  end

  def initial_setup
    @posx = @posy = 0
    @panels = {}
    @heading = :u
    @start_color = 0 # start on a black panel
  end

  def position
    [@posx, @posy]
  end

  def move!(distance)
    case @heading
    when :u
      @posy -= distance
    when :r
      @posx += distance
    when :d
      @posy += distance
    when :l
      @posx -= distance
    end
  end

  def turn!(direction)
    @heading = TURNS[@heading][direction]
  end

  def paint!(color)
    @panels[position] = color if current_color != color
  end

  def current_color
    @panels[position] || 0
  end

  def run_computer(input)
    computer.waiting? ? computer.restart!(input) : computer.run!(@start_color, @test)
  end

  def computer
    @computer ||= Intcode::Computer.new(@input.first)
  end
end

Solution.new.run! # true
