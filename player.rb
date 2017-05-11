require 'pry'

class Player

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
    direction
  end

  def walk(steps)
    steps
  end

end
