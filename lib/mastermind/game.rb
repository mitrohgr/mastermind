class Game
  TURNS = 22

  attr_reader :code_maker, :code_breaker
  attr_accessor :secret_code

  def initialize(code_maker, code_breaker)
    @secret_code = ''
    @code_maker = code_maker.new(self)
    @code_breaker = code_breaker.new(self)
  end

  def evaluate(secret_code, guessed_code)
    pegs = { red: 0, white: 0 }
    guessed_code.chars.each_with_index do |color, idx|
      next unless secret_code.include?(color)

      if color.match?(secret_code[idx])
        pegs[:red] += 1
      else
        pegs[:white] += 1
      end
    end
    pegs
  end

  def feedback(pegs)
    "red pegs: #{pegs[:red]}, white pegs: #{pegs[:white]}"
  end

  def play
    self.secret_code = code_maker.generate_code
    TURNS.times do |turn|
      guessed_code = code_breaker.guess_code
      pegs = evaluate(secret_code, guessed_code)
      puts "=> turn: #{turn + 1}, guess: #{guessed_code}, #{feedback(pegs)}"
      break if pegs[:red] == 4
    end
  end
end
