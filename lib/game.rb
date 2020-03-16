require 'colorize'
$word_array = []
def get_word_array
  File.open("dictionary.txt", "r") do |file|
    file.readlines.each do |line|
      if line.strip.length >= 5 && line.length <= 12
        $word_array << line.chomp
      end
    end
      
  end
end
get_word_array

def random_word(array)
  array.sample
end

class Game
  attr_accessor :word, :turns
  get_word_array
  def initialize
    @lose = File.read("lose.txt")
    @win = File.read("win.txt")
    @word = random_word($word_array)
    @turns = 6
    @letter_array = @word.split("")
    @guess = nil
    @output = Array.new(@word.length, "_")
    @bad_guesses = []
  end

  def show_turns
    "#{@turns}"
  end

  def get_guess
    @guess = gets.chomp.downcase
  end

  def message(first=true)
    if first == true
      puts "\tThe word is " + "#{@word.length} ".red + "characters long"
    end
    puts "\tThere are " + "#{@turns.to_s.cyan}" + " wrong guesses left"
    puts "\tGuess the letter"
  end

  def show_output
    @output
  end

  def update_output
    @letter_array.each_with_index do |letter, index|
      if @letter_array[index] == @guess
        @output[index] = @guess
      end
    end
  end

  def compare_guess
    @letter_array.none?{|letter| letter == @guess} ? @turns -= 1 : update_output
    @letter_array.none?{|letter| letter == @guess} ? @bad_guesses << @guess : :nil
  end

  def reset
    @word = random_word($word_array)
    @turns = 6
    @letter_array = @word.split("")
    @guess = nil
    @output = Array.new(@word.length, "_")
    @bad_guesses = []
  end

  def play_again?
    yes_answers = ["yes", "ya", "y", "1", "affirmative", "aye aye", "yup", "sure", "why not", "okay", "ok"]
    no_answers = ["no", "nope", "negative", "no thanks", "nah"]
    puts "Play again?"
    answer = gets.chomp.downcase
    if yes_answers.any?(answer)
      reset
      game_loop
    else
      exit
    end
  end

  def game_loop
    system 'clear'
    until @turns == 0
      message
      p show_output.join(" ")
      p "Bad Guesses[#{@bad_guesses.join(" ")}]"
      get_guess
      compare_guess
      if @output.join("") == @word
        puts @win.red
        puts "You win!! ;)"
        play_again?
      end
      system 'clear'
    end
    puts "u lose ;)"
    puts @lose.red
    puts "The word was '#{@word}' idiot l0lo0lo0ol"
    play_again?
  end

end
game = Game.new
game.game_loop

#show letters guessed already



