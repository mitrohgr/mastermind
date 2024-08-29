require_relative 'mastermind/game'
require_relative 'mastermind/player'

module Mastermind
  def self.start
    Game.new(Computer.new, Human.new).play
  end
end
