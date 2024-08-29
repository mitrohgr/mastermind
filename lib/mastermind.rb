require_relative 'mastermind/player'

class Mastermind
  TURNS = 12

  attr_reader :player

  def initialize
    @player = Computer.new
  end

  def play
    TURNS.times do
      puts "secret code: #{player.generate_code}"
    end
  end
end
