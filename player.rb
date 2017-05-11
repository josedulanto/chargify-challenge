require 'pry'

class Player
  attr_reader :direction, :x, :y, :locations

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize
    @direction = NORTH
    @x = 0
    @y = 0
    @locations = []
  end

  def say_hello
    'Hello World!'
  end

  def move_to(*args)
    args.join(' ').scan(/(L|R)(\d+)/).each do |direction, steps|
      turn(direction)
      simple_walk(steps.to_i)
    end
    @x.abs + @y.abs
  end

  def turn(direction)
    @direction += (direction == 'R' ? 1 : -1)
    @direction = NORTH if @direction > WEST
    @direction = WEST if @direction.negative?
  end

  def simple_walk(steps)
    case @direction
    when NORTH then @y += steps
    when EAST then @x += steps
    when SOUTH then @y -= steps
    when WEST then @x -= steps
    end
  end

  def recorded_walk(steps)
    steps.times do
      simple_walk(1)
      @locations << [@x, @y]
    end
  end

end
