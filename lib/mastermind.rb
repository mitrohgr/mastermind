require_relative 'mastermind/game'
require_relative 'mastermind/player'

module Mastermind
  def self.start
    print "=> Type 'c' to create code or 'g' to guess code: "
    choice = gets.chomp
    case choice
    when 'c'
      Game.new(Human, Computer).play
    when 'g'
      Game.new(Computer, Human).play
    end
  end
end
