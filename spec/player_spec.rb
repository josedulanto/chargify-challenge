require 'minitest/autorun'
require 'minitest/spec'
require_relative '../player'

describe Player do
  before do
    @player = Player.new
  end

  describe 'sanity test' do
    it 'should say hello' do
      @player.say_hello.must_equal 'Hello World!'
    end
  end

  describe 'turning' do
    it 'should be facing EAST if turns to the right' do
      @player.turn('R')
      @player.direction.must_equal(Player::EAST)
    end

    it 'should be facing SOUTH if turns to the left two times' do
      @player.turn('L')
      @player.turn('L')
      @player.direction.must_equal(Player::SOUTH)
    end
  end

  describe 'walking' do
    it 'should walk 5 steps north' do
      @player.walk(5)
      [@player.x, @player.y].must_equal([0, 5])
    end

    it 'should walk 5 steps north, 5 steps east' do
      @player.walk(5)
      @player.turn('R')
      @player.walk(5)
      [@player.x, @player.y].must_equal([5, 5])
    end
  end

  describe 'exercise tests' do
    it 'should leave me 2 blocks East and 3 blocks North, or 5 blocks away if following R2, L3' do
      @player.move_to('R2', 'L3').must_equal(5)
    end

    it 'should leave me 2 blocks due South of my starting position which is 2 blocks away if following R2, R2, R2' do
      @player.move_to('R2', 'R2', 'R2').must_equal(2)
    end

    it 'should leave me 12 blocks away if following R5, L5, R5, R3' do
      @player.move_to('R5', 'L5', 'R5', 'R3').must_equal(12)
    end
  end

end
