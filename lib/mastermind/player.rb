class Player
  COLORS = %w[Red Green Blue Orange Yellow Pink]

  attr_reader :colors

  def initialize
    @colors = COLORS.shuffle.sample(4)
  end
end
