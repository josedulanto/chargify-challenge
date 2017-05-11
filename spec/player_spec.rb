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

  it 'should leave me 2 blocks East and 3 blocks North, or 5 blocks away if following R2, L3' do
    @player.walk('R2', 'L3').must_equal(5)
  end

  it 'should leave me 2 blocks due South of my starting position which is 2 blocks away if following R2, R2, R2' do
    @player.walk('R2', 'R2', 'R2').must_equal(2)
  end

  it 'should leave me 12 blocks away if following R5, L5, R5, R3' do
    @player.walk('R5', 'L5', 'R5', 'R3').must_equal(12)
  end
end
