require_relative 'models/game'
require_relative 'exceptions/number_wrong'

class NumberGuessing

  LEVELS_OPTIONS = {
    EASY: 1,
    MEDIUM: 2,
    HARD: 3
  }.freeze

  def start_game
    choice = set_level
    game = Game.new(choice)
    set_round(game)
    end_game
  end


  def set_round(game)
    1.upto(game.chances) do |round|
      print '======================================'
      puts "\nRound #{round}°"

      begin
        print "\nEnter you guess: "
        guess = gets.chomp.to_i
        if game.evaluate(guess) == :equal
          puts "Congratulations! You guessed #{guess}, the correct number in #{round} attempts.\n"
          break
        else
          puts "\nIncorrect! The number is #{game.evaluate(guess).to_s} than #{guess}\n"
        end
      rescue NumberWrong
        puts "\nPlease digit a number between 1 to 100\n"
        retry
      end
    end

  end

  def set_level
    puts "\nPlease select the difficulty level:\n1. Easy (10 chances)\n2. Medium (5 chances)\n3. Hard (3 chances)\n"

    begin
      print "\nEnter you choice: "
      choice = gets.chomp.to_i
      raise NumberWrong, "\nWrong option, Please select the level again\n" unless LEVELS_OPTIONS.values.include? choice
    rescue NumberWrong => e
      puts e.message
      retry
    end
    puts "\nGreat! You have selected the #{LEVELS_OPTIONS.key(choice).to_s.capitalize} difficulty level.\n"
    LEVELS_OPTIONS.key(choice)
  end

  def end_game
    puts "\nWould you like play again?\n 1.Yes\n2.No"
    print "\nEnter your option: "
    choice = gets.chomp.to_i
    if choice == 1
      start_game
    else
      exit!
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  puts "Welcome to the Number Guessing Game!\nI'm thinking of a number between 1 and 100.\n"
  number_guessing = NumberGuessing.new
  number_guessing.start_game
end
