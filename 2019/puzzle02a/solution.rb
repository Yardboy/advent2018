#!/usr/local/bin/ruby

require '../solution2019'

class Solution < Solution2019
  private

  def process_input
    update_input
    @position = 0
    send "opcode#{opcode}" while opcode != 99
    @answer = @input.first
  end

  def opcode
    @input[@position]
  end

  def update_input
    @input[1] = 12
    @input[2] = 2
  end

  def process_opcode(opcode)
    send "opcode#{opcode}"
  end

  def opcode1
    update_value(position_mode(1) + position_mode(2), 3)
    move_pointer(4)
  end

  def opcode2
    update_value(position_mode(1) * position_mode(2), 3)
    move_pointer(4)
  end

  def opcode3
    update_value(user_input, 1)
    move_pointer(2)
  end

  def opcode4
    puts @answer = position_mode(1)
    move_pointer(2)
  end

  def move_pointer(value)
    @position += value
  end

  def position_mode(parm)
    @input[@input[@position + parm]]
  end

  def update_value(value, parm)
    @input[@input[@position + parm]] = value
  end

  # override
  def read_input
    super
    @input = @input.first.split(',').map(&:to_i)
  end
end

Solution.new.run! # true
