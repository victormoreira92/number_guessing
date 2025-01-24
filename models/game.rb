# frozen_string_literal: true
require_relative 'game_levels'

# Game
#
class Game
  attr_reader :chances, :number_selected

  def initialize(chances)
    @chances = GameLevels.const_get(chances)
    @number_selected = [*1..100].sample
  end

  def evaluate(guess_number)
    unless [*1..100].include? guess_number
      raise NumberWrong
    end

    if guess_number > number_selected
      :less
    elsif guess_number < number_selected
      :greater
    elsif guess_number == number_selected
      :equal
    end
  end
end
