require 'pry'

class Player
  attr_reader :direction

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize
    @direction = NORTH
  end

  def say_hello
    'Hello World!'
  end

  def move_to(*args)
    args.join(' ').scan(/(L|R)(\d+)/).each do |direction, steps|
      turn(direction)
      walk(steps)
    end
  end

  def turn(direction)
    @direction += (direction == 'R' ? 1 : -1)
    @direction = NORTH if @direction > WEST
    @direction = WEST if @direction.negative?
  end

  def walk(steps)
    steps
  end

end
