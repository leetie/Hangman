#saving and loading methods
require 'yaml'

module Save_load
  def save
    File.open("save.yaml", "w+"){|f| f.write(YAML::dump(self))}
  end

  def load
    File.open("save.yaml") do |f|
      x = YAML::load(f)
      self.turns = x.turns
      self.word = x.word 
      self.turns = x.turns
      self.letter_array = x.letter_array
      self.output = x.output
      self.bad_guesses = x.bad_guesses
      puts "GAME LOADED..."
      sleep 1.5
    end
  end

  def save?
    if self.guess.downcase == "save"
      puts "game has been saved"
      self.save
      sleep 2
    end
  end

  def load?
    if self.guess.downcase == "load"
      self.load
    end
  end
end
