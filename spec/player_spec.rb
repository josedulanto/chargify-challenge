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

  describe 'simple walking' do
    it 'should walk 5 steps north' do
      @player.simple_walk(5)
      [@player.x, @player.y].must_equal([0, 5])
    end

    it 'should walk 5 steps north, 5 steps east' do
      @player.simple_walk(5)
      @player.turn('R')
      @player.simple_walk(5)
      [@player.x, @player.y].must_equal([5, 5])
    end
  end

  describe 'recorded walking' do
    it 'should record locations when walking 5 steps north' do
      @player.recorded_walk(5)
      [@player.x, @player.y].must_equal([0, 5])
      @player.locations.must_equal([[0, 1], [0, 2], [0, 3], [0, 4], [0, 5]])
    end

    it 'should walk 5 steps north, 5 steps east' do
      @player.recorded_walk(5)
      @player.turn('R')
      @player.recorded_walk(5)
      [@player.x, @player.y].must_equal([5, 5])
      @player.locations.must_equal([[0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                                    [1, 5], [2, 5], [3, 5], [4, 5], [5, 5]])
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

  describe 'part 1' do
    it 'should intercept the star' do
      @player.move_to('L4', 'L3', 'R1', 'L4', 'R2', 'R2', 'L1', 'L2', 'R1',
              'R1', 'L3', 'R5', 'L2', 'R5', 'L4', 'L3', 'R2', 'R2', 'L5',
              'L1', 'R4', 'L1', 'R3', 'L3', 'R5', 'R2', 'L5', 'R2', 'R1',
              'R1', 'L5', 'R1', 'L3', 'L2', 'L5', 'R4', 'R4', 'L2', 'L1',
              'L1', 'R1', 'R1', 'L185', 'R4', 'L1', 'L1', 'R5', 'R1', 'L1',
              'L3', 'L2', 'L1', 'R2', 'R2', 'R2', 'L1', 'L1', 'R4', 'R5',
              'R53', 'L1', 'R1', 'R78', 'R3', 'R4', 'L1', 'R5', 'L1', 'L4',
              'R3', 'R3', 'L3', 'L3', 'R191', 'R4', 'R1', 'L4', 'L1', 'R3',
              'L1', 'L2', 'R3', 'R2', 'R4', 'R5', 'R5', 'L3', 'L5', 'R2',
              'R3', 'L1', 'L1', 'L3', 'R1', 'R4', 'R1', 'R3', 'R4', 'R4',
              'R4', 'R5', 'R2', 'L5', 'R1', 'R2', 'R5', 'L3', 'L4', 'R1',
              'L5', 'R1', 'L4', 'L3', 'R5', 'R5', 'L3', 'L4', 'L4', 'R2',
              'R2', 'L5', 'R3', 'R1', 'R2', 'R5', 'L5', 'L3', 'R4', 'L5',
              'R5', 'L3', 'R1', 'L1', 'R4', 'R4', 'L3', 'R2', 'R5', 'R1',
              'R2', 'L1', 'R4', 'R1', 'L3', 'L3', 'L5', 'R2', 'R5', 'L1',
              'L4', 'R3', 'R3', 'L3', 'R2', 'L5', 'R1', 'R3', 'L3', 'R2',
              'L1', 'R4', 'R3', 'L4', 'R5', 'L2', 'L2', 'R5', 'R1', 'R2',
              'L4', 'L4', 'L5', 'R3', 'L4')
             .must_equal(332)
    end
  end

  describe 'part 2' do
    it 'should find the first location visited twice' do
      @player.move_to('L4', 'L3', 'R1', 'L4', 'R2', 'R2', 'L1', 'L2', 'R1',
              'R1', 'L3', 'R5', 'L2', 'R5', 'L4', 'L3', 'R2', 'R2', 'L5',
              'L1', 'R4', 'L1', 'R3', 'L3', 'R5', 'R2', 'L5', 'R2', 'R1',
              'R1', 'L5', 'R1', 'L3', 'L2', 'L5', 'R4', 'R4', 'L2', 'L1',
              'L1', 'R1', 'R1', 'L185', 'R4', 'L1', 'L1', 'R5', 'R1', 'L1',
              'L3', 'L2', 'L1', 'R2', 'R2', 'R2', 'L1', 'L1', 'R4', 'R5',
              'R53', 'L1', 'R1', 'R78', 'R3', 'R4', 'L1', 'R5', 'L1', 'L4',
              'R3', 'R3', 'L3', 'L3', 'R191', 'R4', 'R1', 'L4', 'L1', 'R3',
              'L1', 'L2', 'R3', 'R2', 'R4', 'R5', 'R5', 'L3', 'L5', 'R2',
              'R3', 'L1', 'L1', 'L3', 'R1', 'R4', 'R1', 'R3', 'R4', 'R4',
              'R4', 'R5', 'R2', 'L5', 'R1', 'R2', 'R5', 'L3', 'L4', 'R1',
              'L5', 'R1', 'L4', 'L3', 'R5', 'R5', 'L3', 'L4', 'L4', 'R2',
              'R2', 'L5', 'R3', 'R1', 'R2', 'R5', 'L5', 'L3', 'R4', 'L5',
              'R5', 'L3', 'R1', 'L1', 'R4', 'R4', 'L3', 'R2', 'R5', 'R1',
              'R2', 'L1', 'R4', 'R1', 'L3', 'L3', 'L5', 'R2', 'R5', 'L1',
              'L4', 'R3', 'R3', 'L3', 'R2', 'L5', 'R1', 'R3', 'L3', 'R2',
              'L1', 'R4', 'R3', 'L4', 'R5', 'L2', 'L2', 'R5', 'R1', 'R2',
              'L4', 'L4', 'L5', 'R3', 'L4',
              find_location_visited_twice: true)
             .must_equal(166)
    end
  end

end
