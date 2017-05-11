require 'minitest/autorun'
require 'minitest/spec'
require_relative '../player'

describe Player do
  before do
    @player = Player.new
  end

  it 'should say hello (sanity test)' do
    @player.say_hello.must_equal 'Hello World!'
  end

  it 'should walk some steps' do
    @player.walk(5).must_equal(5)
  end

  it 'should turn to the right' do
    @player.turn('R').must_equal('R')
  end

  it 'should turn to the left' do
    @player.turn('L').must_equal('L')
  end

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
