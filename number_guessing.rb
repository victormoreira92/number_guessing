require_relative 'exceptions/number_wrong'

class NumberGuessing
  attr_reader :number_selected, :level_game

  LEVELS_OPTIONS = {
    EASY: 10,
    MEDIUM: 5,
    HARD: 3
  }.freeze


  def start_game
    @number_selected = [*1..100].sample
    @level_game = set_level
    set_round
    end_game
  end

  def set_level
    puts "\nPlease select the difficulty level:\n1. Easy (10 chances)\n2. Medium (5 chances)\n3. Hard (3 chances)\n"

    begin
      puts "\nEnter you choice: "
      choice = gets.chomp.to_i
      raise NumberWrong, "\nWrong option, Please select the level again\n" unless [*1..3].include? choice
    rescue NumberWrong => e
      puts e.message
      retry
    end
    puts "\nGreat! You have selected the #{LEVELS_OPTIONS.keys[choice - 1].to_s.capitalize} difficulty level.\n"
    LEVELS_OPTIONS.keys[choice - 1]
  end

  def set_round
    1.upto(LEVELS_OPTIONS[@level_game]) do |round|
      puts '================================================='
      puts "\nRound #{round}°"
      resp = evaluate_guess
      if resp[:compare].zero?
        puts "\nCongratulations! You guessed the correct number in #{round} attempts.\n"
        puts "\n================================================="
        break
      else
        puts "\nIncorrect! The number is #{return_compare(resp[:compare])} than #{resp[:guess_number]}\n"
      end
    end

    puts "\nThe correct number was #{@number_selected}"
  end

  def evaluate_guess
    begin
      puts "\nEnter you guess: "
      guess_number = gets.chomp.to_i
      resp = {}
      unless [*1..100].include? guess_number
        raise NumberWrong
      end

      resp = { guess_number: guess_number, compare: guess_number <=> @number_selected }
    rescue NumberWrong
      puts "\nPlease digit a number between 1 to 100\n"
      retry
    end
  end


  def end_game
    puts "\nWould you like play again?\n1.Yes\n2.No"
    puts "\nEnter your option: "
    choice = gets.chomp.to_i
    if choice == 1
      start_game
    else
      exit!
    end
  end

  private
  def return_compare(compare)
    compare >= 1 ? 'less' : 'greater'
  end

end


if __FILE__ == $PROGRAM_NAME
  puts "Welcome to the Number Guessing Game!\nI'm thinking of a number between 1 and 100.\n"
  number_guessing = NumberGuessing.new
  number_guessing.start_game
end
