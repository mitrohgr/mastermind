class Game
  TURNS = 12

  attr_reader :code_maker, :code_breaker
  attr_accessor :secret_code

  def initialize(code_maker, code_breaker)
    @secret_code = ''
    @code_maker = code_maker
    @code_breaker = code_breaker
  end

  def play
    self.secret_code = code_maker.generate_code
    puts "code: #{secret_code}"
    TURNS.times do |turn|
      guessed_code = code_breaker.guess_code
      puts "=> turn: #{turn + 1}, guess: #{guessed_code}"
    end
  end
end
