require 'minitest/autorun'
require 'minitest/spec'
require_relative '../player'

describe Player do
  it 'should say hello (sanity test)' do
    Player.new.say_hello.must_equal 'Hello World!'
  end
end
