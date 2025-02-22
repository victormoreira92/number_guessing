require_relative 'exceptions/number_wrong'

class NumberGuessing
  attr_reader :number_selected, :level_game, :start_time, :end_time

  LEVELS_OPTIONS = {
    EASY: 10,
    MEDIUM: 5,
    HARD: 3
  }.freeze


  def start_game
    @number_selected = [*1..100].sample
    @level_game = set_level
    set_chances
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

  def set_chances
    set_start_timer
    win = false
    1.upto(LEVELS_OPTIONS[@level_game]) do |round|
      puts '================================================='
      puts "\nRound #{round}°"
      get_clue(round)
      resp = evaluate_guess
      if resp[:compare].zero?
        puts "\nCongratulations! You guessed the correct number in #{round} attempts.\n"
        puts "\n================================================="
        win = true
        break
      else
        puts "\nIncorrect! The number is #{resp[:compare] >= 1 ? 'less' : 'greater'} than #{resp[:guess_number]}\n"
      end
    end
    set_end_timer
    puts "\n================================================="
    puts "\nGame Over !! You didn't discover the number\n" unless win
    puts "\nThis round during #{timer}"
    puts "\nThe correct number was #{@number_selected}"
    puts "\n================================================="

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

  def get_clue(round)
    clue_round = {
      HARD: 2,
      EASY: 5,
      MEDIUM: 3
    }

    if clue_round[level_game] == round
      puts "\nAre you stuck? Would you like a clue?\n1.Yes\n2.No"
      begin
        option = gets.chomp.to_i
        raise NumberWrong unless [1,2].include? option
        if option == 1
          puts "\nThe secret number is between #{@number_selected - 10} and #{number_selected + 10}\n"
        end
      rescue NumberWrong
        puts "\nPlease digit 1 for Yes or 2 for No\n"
        retry
      end
    end
  end


  def end_game
    puts "\nWould you like play again?\n1.Yes\n2.No"
    puts "\nEnter your option: "
    begin
      option = gets.chomp.to_i
      raise NumberWrong unless [1,2].include? option
      if option == 1
        puts "Let's play again!!"
        start_game
      else
        puts "Thanks for playing!!"
        exit!
      end
    rescue NumberWrong
      puts "\nPlease digit 1 for Yes or 2 for No\n"
      retry
    end
  end

  private
  def set_start_timer
    @start_time = Time.now
  end

  def set_end_timer
    @end_time = Time.now
  end

  def timer
    minutes = (end_time - start_time) / 60
    if minutes > 1
      seconds = (end_time - start_time) % 60
      "#{minutes.to_i.to_s.rjust(2,"0")} minutes #{seconds.to_i.to_s.rjust(2,"0")} seconds"
    else
      seconds = (end_time - start_time)
      "#{seconds.to_i.to_s.rjust(2,"0")} seconds"
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  puts "Welcome to the Number Guessing Game!\nI'm thinking of a number between 1 and 100.\n"
  number_guessing = NumberGuessing.new
  number_guessing.start_game
end
