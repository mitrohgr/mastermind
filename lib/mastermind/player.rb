class Player
  COLORS = %w[Red Green Blue Orange Yellow Pink]

  attr_reader :game, :colors

  def initialize(game)
    @game = game
    @colors = COLORS.shuffle.sample(4)
  end
end

class Human < Player
  def generate_code
    print '=> Create a secret code: '
    gets.chomp
  end

  def guess_code
    print '=> Take a guess: '
    gets.chomp
  end
end

class Computer < Player
  attr_reader :colors_set, :secret_code_set

  def initialize(game)
    super
    @guessed = false
    @colors_set = COLORS.repeated_permutation(4).to_a
    @secret_code_set = colors_set.reduce([]) do |set, colors|
      set.push(colors.map! { |color| color[0].upcase }.join)
    end
  end

  def generate_code
    colors.map { |color| color[0].upcase }.join
  end

  def guess_code
    current_guess = ''
    if @guessed == false
      @guessed = true
      current_guess = 'RROO'
      return current_guess
    else
      current_guess = secret_code_set[0]
    end

    pegs1 = game.evaluate(game.secret_code, current_guess)
    secret_code_set.delete_if do |code|
      pegs2 = game.evaluate(current_guess, code)
      if pegs2[:white] >= 1
        pegs2[:red] != pegs1[:red] && pegs2[:white] != pegs1[:white]
      elsif pegs2[:white].zero?
        pegs2[:red] != pegs1[:red]
      end
    end

    current_guess
  end
end
